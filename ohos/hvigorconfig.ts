// CommonJS shim so hvigor can require this file even if it looks like TypeScript.
const path = require('path');
let injectNativeModules;
try {
	injectNativeModules = require('flutter-hvigor-plugin').injectNativeModules;
} catch (e) {
	// ignore — plugin may not be present in some hvigor environments
}

// Make injection safe: some hvigor environments or plugin versions may not
// expose injectNativeModules or it may throw. Guard to avoid hvigor init crash.
try {
	if (typeof injectNativeModules === 'function') {
		injectNativeModules(__dirname, path.dirname(__dirname));
	}
} catch (e) {
	// swallow error to avoid breaking hvigor initialization; logging happens
	// in hvigor daemon output if needed.
}