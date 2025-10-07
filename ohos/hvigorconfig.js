const path = require('path');
// This file is a small CommonJS shim to safely inject native modules into hvigor.
// It mirrors the behavior of the original TypeScript file but uses require() so
// it can be evaluated without a TypeScript transpiler in hvigor daemon.
let injectNativeModules;
try {
  // attempt to load the helper exported by the flutter-hvigor-plugin package
  // when available in the hvigor runtime environment.
  injectNativeModules = require('flutter-hvigor-plugin').injectNativeModules;
} catch (e) {
  // ignore — the plugin may not be present in some hvigor environments.
}

try {
  if (typeof injectNativeModules === 'function') {
    injectNativeModules(__dirname, path.dirname(__dirname));
  }
} catch (e) {
  // swallow to avoid breaking hvigor initialization
}
