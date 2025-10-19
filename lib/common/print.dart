import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:zhuquejiasu/state.dart';

import 'path.dart';

class CommonPrint {
  static CommonPrint? _instance;
  bool _logFileAnnounced = false;

  CommonPrint._internal();

  factory CommonPrint() {
    _instance ??= CommonPrint._internal();
    return _instance!;
  }

  log(String? text) {
    final payload = "[ZhuqueJiasu] $text";
    debugPrint(payload);
    developer.log(payload, name: 'ZhuqueJiasu');
    _appendLog(payload);
    if (globalState.isService) {
      return;
    }
    if (!globalState.isService) {
      try {
        globalState.appController.addLog(
          Log(logLevel: LogLevel.info, payload: payload),
        );
      } catch (error, stackTrace) {
        developer.log(
          "Skipped UI log append: $error",
          name: 'ZhuqueJiasu',
          stackTrace: stackTrace,
        );
      }
    }
  }

  void _appendLog(String payload) {
    unawaited(() async {
      try {
        final dirPath = await appPath.homeDirPath;
        final file = File(p.join(dirPath, 'zhuquejiasu.log'));
        await file.parent.create(recursive: true);
        if (!_logFileAnnounced) {
          final pathMessage = "Log file location: ${file.path}";
          developer.log(pathMessage, name: 'ZhuqueJiasu');
          debugPrint("[ZhuqueJiasu] $pathMessage");
          _logFileAnnounced = true;
        }
        await file.writeAsString(
          "${DateTime.now().toIso8601String()} $payload\n",
          mode: FileMode.append,
        );
      } catch (error, stackTrace) {
        developer.log(
          "Failed to append log entry",
          name: 'ZhuqueJiasu',
          error: error,
          stackTrace: stackTrace,
        );
      }
    }());
  }
}

final commonPrint = CommonPrint();
