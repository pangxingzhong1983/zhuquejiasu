#!/usr/bin/env node
// Diagnose hvigor signing material: try PBKDF2 input encodings and aes-gcm packaging
// Prints a compact matrix of which combinations successfully decrypt CE and the encrypted
// storePassword entries found in build-profile.json5.
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const projectDir = process.cwd();
const materialDir = path.resolve(projectDir, 'material');
const fdDir = path.resolve(materialDir, 'fd');
const acDir = path.resolve(materialDir, 'ac');
const ceDir = path.resolve(materialDir, 'ce');

function readFileBytes(p) {
  if (!fs.existsSync(p)) return null;
  return fs.readFileSync(p);
}

const salt = readFileBytes(path.resolve(acDir, 'salt.bin'));
const ceBuf = readFileBytes(path.resolve(ceDir, 'ce.bin'));
if (!salt || !ceBuf) {
  console.error('Missing salt or ce.bin in material directory.');
  process.exit(2);
}

// Collect all candidate encrypted password fields from build-profile.json5
const buildProfilePath = path.resolve(projectDir, 'build-profile.json5');
const bp = fs.existsSync(buildProfilePath) ? fs.readFileSync(buildProfilePath, 'utf8') : '';
const candHex = new Set();
const candPlain = new Set();
// match long hex-like strings (>= 40 hex chars) and also shorter ones
const hexRe = /\b([0-9a-fA-F]{40,})\b/g;
let m;
while ((m = hexRe.exec(bp)) !== null) candHex.add(m[1]);
// also capture plaintext-looking password entries (non-hex, between quotes after storePassword)
const pwRe = /storePassword"\s*:\s*"([^"]+)"/g;
while ((m = pwRe.exec(bp)) !== null) {
  const s = m[1];
  if (/^[0-9a-fA-F]+$/.test(s)) continue;
  candPlain.add(s);
}

console.log('Diagnostic: found', candHex.size, 'hex candidates and', candPlain.size, 'plain candidates in build-profile.json5');

// PBKDF2 input variants to try
const pbkdf2Inputs = [
  { name: 'raw-buffer', fn: (buf)=>buf },
  { name: 'utf8', fn: (buf)=>buf.toString('utf8') },
  { name: 'latin1', fn: (buf)=>buf.toString('latin1') },
  { name: 'hex', fn: (buf)=>buf.toString('hex') },
  { name: 'base64', fn: (buf)=>buf.toString('base64') }
];

// CE parse variants: combinations of having 4-byte BE len header, 4-byte LE len header, or no header
function tryParseAesGcmPacked(buf) {
  const candidates = [];
  // try with BE header
  if (buf.length >= 4) {
    const len = buf.readUInt32BE(0);
    const iv = buf.slice(4, 4+len);
    const rest = buf.slice(4+len);
    if (iv.length === len && rest.length >= 16) candidates.push({iv, ct: rest.slice(0, rest.length-16), tag: rest.slice(rest.length-16), header:'BE-4'});
    // LE
    const lenle = buf.readUInt32LE(0);
    const ivle = buf.slice(4, 4+lenle);
    const restle = buf.slice(4+lenle);
    if (ivle.length === lenle && restle.length >= 16) candidates.push({iv:ivle, ct: restle.slice(0, restle.length-16), tag: restle.slice(restle.length-16), header:'LE-4'});
  }
  // no header: assume iv is 12 bytes then ct + tag
  if (buf.length >= 12+16) {
    const iv = buf.slice(0,12);
    const rest = buf.slice(12);
    const tag = rest.slice(rest.length-16);
    const ct = rest.slice(0, rest.length-16);
    candidates.push({iv, ct, tag, header:'NO-HEADER-12'});
  }
  return candidates;
}

function tryDecryptGcm(bufferKey, packedBuf) {
  const parsed = tryParseAesGcmPacked(packedBuf);
  for (const p of parsed) {
    try {
      const dec = crypto.createDecipheriv('aes-128-gcm', bufferKey, p.iv);
      dec.setAuthTag(p.tag);
      const out = Buffer.concat([dec.update(p.ct), dec.final()]);
      return {ok:true, out: out.toString('hex'), header: p.header};
    } catch (e) {
      // continue
    }
  }
  return {ok:false};
}

// Try each PBKDF2 input -> derivedKey -> CE decrypt
const xorParts = [];
// read fd parts if present
for (let i=1;i<=3;i++) {
  const p = readFileBytes(path.resolve(fdDir, `part${i}`, `part${i}.bin`));
  if (p) xorParts.push(p);
}
const component = Buffer.from([49,243,9,115,214,175,91,184,211,190,177,88,101,131,192,119]);
if (xorParts.length === 3) {
  const xorAll = Buffer.alloc(16);
  for (let i=0;i<16;i++) {
    xorAll[i] = xorParts[0][i] ^ xorParts[1][i] ^ xorParts[2][i] ^ component[i];
  }
  console.log('Found fd parts and component; trying derivations...');
  const successes = [];
  for (const inp of pbkdf2Inputs) {
    const pwd = inp.fn(xorAll);
    let derived;
    try {
      derived = crypto.pbkdf2Sync(pwd, salt, 10000, 16, 'sha256');
    } catch (e) {
      console.error('pbkdf2 failed for', inp.name, e && e.message);
      continue;
    }
    const dres = tryDecryptGcm(derived, ceBuf);
    const ok = dres.ok ? `CE-OK:${dres.header}` : 'CE-FAIL';
    successes.push({encoding: inp.name, derived: derived.toString('hex').slice(0,16), ce: ok});
  }
  console.log('CE derivation results:');
  for (const s of successes) console.log(' ', s.encoding, s.ce, 'derivedPrefix=', s.derived);

  // If any CE decrypt succeeded, grab interKey and attempt to decrypt candidate storePassword hexes
  for (const inp of pbkdf2Inputs) {
    const pwd = inp.fn(xorAll);
    const derived = crypto.pbkdf2Sync(pwd, salt, 10000, 16, 'sha256');
    const dres = tryDecryptGcm(derived, ceBuf);
    if (!dres.ok) continue;
    // parse interKey
    const parsed = tryParseAesGcmPacked(ceBuf);
    let interKeyBuf = null;
    for (const p of parsed) {
      try {
        const dec = crypto.createDecipheriv('aes-128-gcm', derived, p.iv);
        dec.setAuthTag(p.tag);
        const out = Buffer.concat([dec.update(p.ct), dec.final()]);
        interKeyBuf = out; break;
      } catch (e) {}
    }
    if (!interKeyBuf) continue;
    console.log('\nUsing PBKDF2 input', inp.name, '=> interKey', interKeyBuf.toString('hex'));
    // test each found hex candidate
    for (const h of candHex) {
      const buf = Buffer.from(h, 'hex');
      const pres = tryDecryptGcm(interKeyBuf, buf);
      console.log('  storeHex len=' + h.length/2 + ' bytes =>', pres.ok ? `OK(${pres.header}) plainLen=${pres.out.length/2}` : 'FAIL');
    }
    // also test plain-looking candidates
    for (const p of candPlain) console.log('  plain candidate (not hex):', p.substring(0,40));
  }
} else {
  console.warn('fd parts not found or incomplete; cannot compute xor-based PBKDF2 input.');
}

console.log('\nDiagnostic finished.');
