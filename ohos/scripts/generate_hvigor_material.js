/*
Generate hvigor-compatible signing material (fd/ac/ce) and set encrypted passwords
Usage: run this script from the ohos project directory with node
*/
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const projectDir = process.cwd();
const materialDir = path.resolve(projectDir, 'material');
const fdDir = path.resolve(materialDir, 'fd');
const acDir = path.resolve(materialDir, 'ac');
const ceDir = path.resolve(materialDir, 'ce');

// Source PKCS#12: try several candidate locations (project dir, workspace root, ohos dir)
const candidates = [
  path.resolve(projectDir, 'ZhuqueHarmony.p12'),
  path.resolve(projectDir, '..', 'ZhuqueHarmony.p12'),
  path.resolve(projectDir, '..', '..', 'ZhuqueHarmony.p12'),
  path.resolve(projectDir, '..', '..', '..', 'ZhuqueHarmony.p12'),
  path.resolve(process.env.HOME || process.env.USERPROFILE, 'workspace', 'ZhuqueHarmony.p12')
];
let p12Path = null;
for (const c of candidates) {
  if (fs.existsSync(c)) { p12Path = c; break; }
}
if (!p12Path) {
  console.error('PKCS#12 source not found at candidate locations. Please put ZhuqueHarmony.p12 in workspace root or update the script.');
  console.error('Tried:', candidates.join('\n  '));
  process.exit(1);
}

// Ensure directories
fs.mkdirSync(fdDir, { recursive: true });
fs.mkdirSync(acDir, { recursive: true });
fs.mkdirSync(ceDir, { recursive: true });

// Write three fd parts (each exactly 16 bytes)
function rand16() {
  return crypto.randomBytes(16);
}
const fd1 = rand16();
const fd2 = rand16();
const fd3 = rand16();

fs.mkdirSync(path.resolve(fdDir, 'part1'), { recursive: true });
fs.writeFileSync(path.resolve(fdDir, 'part1', 'part1.bin'), fd1);
fs.mkdirSync(path.resolve(fdDir, 'part2'), { recursive: true });
fs.writeFileSync(path.resolve(fdDir, 'part2', 'part2.bin'), fd2);
fs.mkdirSync(path.resolve(fdDir, 'part3'), { recursive: true });
fs.writeFileSync(path.resolve(fdDir, 'part3', 'part3.bin'), fd3);

// Also write fd parts to top-level fd/ so hvigor can read them directly
const topFdPartsBase = path.resolve(projectDir, 'fd');
fs.mkdirSync(path.resolve(topFdPartsBase, 'part1'), { recursive: true });
fs.writeFileSync(path.resolve(topFdPartsBase, 'part1', 'part1.bin'), fd1);
fs.mkdirSync(path.resolve(topFdPartsBase, 'part2'), { recursive: true });
fs.writeFileSync(path.resolve(topFdPartsBase, 'part2', 'part2.bin'), fd2);
fs.mkdirSync(path.resolve(topFdPartsBase, 'part3'), { recursive: true });
fs.writeFileSync(path.resolve(topFdPartsBase, 'part3', 'part3.bin'), fd3);

// Write salt to ac (single file)
const salt = crypto.randomBytes(16);
fs.writeFileSync(path.resolve(acDir, 'salt.bin'), salt);

// Also write salt to top-level ac/
const topAcDir = path.resolve(projectDir, 'ac');
fs.mkdirSync(topAcDir, { recursive: true });
fs.writeFileSync(path.resolve(topAcDir, 'salt.bin'), salt);

// hvigor's component constant (copied from DecipherUtil)
const component = Buffer.from([49,243,9,115,214,175,91,184,211,190,177,88,101,131,192,119]);

// xorComponents across fd parts plus component
function xorBuffers(...bufs) {
  if (bufs.length === 0) return Buffer.alloc(0);
  const len = bufs[0].length;
  const out = Buffer.alloc(len);
  for (let i = 0; i < len; i++) {
    let v = 0;
    for (const b of bufs) v ^= b[i];
    out[i] = v;
  }
  return out;
}
const xorAll = xorBuffers(fd1, fd2, fd3, component);

// hvigor's DecipherUtil calls pbkdf2Sync(i.toString(), ...)
// toString() on the xor buffer is required to reproduce hvigor's exact
// PBKDF2 input encoding. Use the string form here to produce the same key.
const pbkdf2Password = xorAll; // Buffer
// Use latin1 (single-byte / binary) encoding to preserve raw byte values when
// converting the XOR buffer to a string for PBKDF2 input. This mirrors the
// common "binary" usage where each byte maps directly to a character.
const derivedKey = crypto.pbkdf2Sync(pbkdf2Password.toString('latin1'), salt, 10000, 16, 'sha256'); // AES-128 key

// Create a random intermediate key (16 bytes) which will be encrypted into ce using derivedKey
const interKey = crypto.randomBytes(16);

// Now choose a final plaintext store password (strong)
const storePasswordPlain = crypto.randomBytes(24).toString('base64').slice(0,32); // 32-char

// Encrypt storePasswordPlain with interKey using AES-128-GCM
function aesGcmPack(key, plaintext) {
  const iv = crypto.randomBytes(12); // 12-byte IV common for GCM
  const cipher = crypto.createCipheriv('aes-128-gcm', key, iv);
  const ct = Buffer.concat([cipher.update(Buffer.from(plaintext, 'utf8')), cipher.final()]);
  const tag = cipher.getAuthTag();
  // Create format: 4-byte big-endian IV length + IV + ciphertext + tag
  const header = Buffer.alloc(4);
  header.writeUInt32BE(iv.length, 0);
  return Buffer.concat([header, iv, ct, tag]);
}

const storePasswordEncBuf = aesGcmPack(interKey, storePasswordPlain);
const storePasswordHex = storePasswordEncBuf.toString('hex');

// Encrypt interKey with derivedKey into CE file
const interKeyEncBuf = aesGcmPack(derivedKey, interKey);
fs.writeFileSync(path.resolve(ceDir, 'ce.bin'), interKeyEncBuf);

// Also write CE to top-level ce/
const topCeDir = path.resolve(projectDir, 'ce');
fs.mkdirSync(topCeDir, { recursive: true });
fs.writeFileSync(path.resolve(topCeDir, 'ce.bin'), interKeyEncBuf);

// Write the actual PKCS#12 to top-level fd folder so sign tool can find it
const topFdDir = path.resolve(projectDir, 'fd');
fs.mkdirSync(topFdDir, { recursive: true });
const dstP12 = path.resolve(topFdDir, 'fd.p12');
fs.copyFileSync(p12Path, dstP12);
fs.chmodSync(dstP12, 0o600);

// Save generated storePasswordHex into build-profile.json5 (storePassword and keyPassword)
// Remove any existing occurrences to avoid duplicate/conflicting entries and then insert the new encrypted fields.
const buildProfilePath = path.resolve(projectDir, 'build-profile.json5');
let bp = fs.readFileSync(buildProfilePath, 'utf8');
// Remove previous storePassword / keyPassword lines in the file to keep the file clean
bp = bp.replace(/\s*"storePassword"\s*:\s*"[^"]*"\s*,?/g, '');
bp = bp.replace(/\s*"keyPassword"\s*:\s*"[^"]*"\s*,?/g, '');
// Insert storePassword and keyPassword fields into existing material block (after "storeFile": "fd",
bp = bp.replace(/("storeFile"\s*:\s*"fd"\s*,)/, `$1\n          "storePassword": "${storePasswordHex}",\n          "keyPassword": "${storePasswordHex}",`);
fs.writeFileSync(buildProfilePath, bp, 'utf8');

// Save plaintext password securely to material/.storepass with restrictive permissions for downstream automation
const storePassFile = path.resolve(materialDir, '.storepass');
fs.writeFileSync(storePassFile, storePasswordPlain + '\n', { mode: 0o600 });

console.log('Generated hvigor signing material:');
console.log(' material/fd with 3 parts under part1..part3 (16 bytes each)');
console.log(' material/ac/salt.bin');
console.log(' material/ce/ce.bin (encrypted intermediate key)');
console.log(' top-level fd/fd.p12 copied from', p12Path);
console.log('Wrote encrypted storePassword/keyPassword into build-profile.json5');
console.log('Plaintext store password (keep safe):', storePasswordPlain);
console.log('Done.');
