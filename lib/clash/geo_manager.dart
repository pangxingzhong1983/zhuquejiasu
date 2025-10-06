import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:fl_clash/common/path.dart';

/// GeoManager: ensure required geo assets are available for the native core.
///
/// Strategy:
/// 1. Prefer bundled assets placed under `assets/data/` (packaged in app).
/// 2. If bundled missing, check previously downloaded copy under app home.
/// 3. If still missing, try to download from configured mirrors with
///    retries. If `geo_hashes.json` is present in assets it will be used to
///    validate downloaded/bundled files via SHA256.
class GeoManager {
  static const requiredFiles = [
    'GeoIP.dat',
    'GeoSite.dat',
    'ASN.mmdb',
  ];

  // Default mirrors (can be extended or made configurable later).
  static const _mirrors = [
    'https://dav.zhuquejiasu.uk/FlClash/assets/data/',
  ];

  /// Ensure all required geo assets exist and are valid.
  /// Returns true when all assets are available (either bundled or downloaded
  /// and verified). If verification hashes are present and any file fails the
  /// hash check this returns false.
  static Future<bool> ensureGeoAssets() async {
    final homePath = await appPath.homeDirPath;
    final homeDir = Directory(homePath);
    if (!await homeDir.exists()) await homeDir.create(recursive: true);

    // Try load optional hash map from bundled asset: assets/data/geo_hashes.json
    Map<String, String> expectedHashes = {};
    try {
      final jsonRaw = await rootBundle.loadString('assets/data/geo_hashes.json');
      final decoded = json.decode(jsonRaw) as Map<String, dynamic>;
      for (final k in decoded.keys) {
        expectedHashes[k] = decoded[k].toString();
      }
    } catch (_) {
      // Not required; we'll operate without strict hash verification if missing.
    }

    final dio = Dio(BaseOptions(responseType: ResponseType.bytes, connectTimeout: const Duration(seconds: 10), receiveTimeout: const Duration(seconds: 20)));

    bool allOk = true;
    for (final fileName in requiredFiles) {
      final localPath = p.join(homePath, fileName);
      final localFile = File(localPath);

      // 1) If a copy already exists in home and passes verification (if any)
      if (await localFile.exists()) {
        final bytes = await localFile.readAsBytes();
        if (bytes.isNotEmpty && _verifyIfNeeded(fileName, bytes, expectedHashes)) {
          continue; // ok
        }
      }

      // 2) Try packaged asset
      try {
        final data = await rootBundle.load('assets/data/$fileName');
        final bytes = data.buffer.asUint8List();
        if (bytes.isNotEmpty && _verifyIfNeeded(fileName, bytes, expectedHashes)) {
          await localFile.writeAsBytes(bytes, flush: true);
          continue;
        }
      } catch (_) {
        // fallthrough to download
      }

      // 3) Download from mirrors with retries
      bool downloaded = false;
      for (final base in _mirrors) {
        final url = '$base$fileName';
        for (int attempt = 0; attempt < 3; attempt++) {
          try {
            final resp = await dio.get<List<int>>(url);
            final bytes = resp.data;
            if (bytes != null && bytes.isNotEmpty) {
              if (!_verifyIfNeeded(fileName, bytes, expectedHashes)) {
                // verification failed
                break;
              }
              await localFile.writeAsBytes(bytes, flush: true);
              downloaded = true;
              break;
            }
          } catch (_) {
            // retry
            await Future.delayed(const Duration(seconds: 1));
          }
        }
        if (downloaded) break;
      }

      if (!downloaded) {
        allOk = false;
        // Keep a detailed log so remote debugging is easier.
        print('[GeoManager] asset $fileName missing and download attempts failed.');
      }
    }

    return allOk;
  }

  static bool _verifyIfNeeded(String fileName, List<int> bytes, Map<String, String> map) {
    if (map.containsKey(fileName) && map[fileName]?.isNotEmpty == true) {
      final expected = map[fileName]!;
      final sum = sha256.convert(bytes).toString();
      final ok = sum == expected;
      if (!ok) {
        print('[GeoManager] checksum mismatch for $fileName expected:$expected actual:$sum');
      }
      return ok;
    }
    // No expected hash available: accept by size > 0.
    return bytes.isNotEmpty;
  }
}
