import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

import 'common.dart';

extension PackageInfoExtension on PackageInfo {
  String get ua => [
        // Use ASCII-safe identifier to satisfy dart:io HttpHeaders
        // Using packageName (bundle identifier) avoids non-ASCII app names
        "${packageName}/v$version",
        "clash-verge",
        "Platform/${Platform.operatingSystem}",
      ].join(" ");
}
