import 'dart:io';

import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/common/path.dart';
import 'package:flutter/cupertino.dart';

class CommonPrint {
  static CommonPrint? _instance;

  CommonPrint._internal();

  factory CommonPrint() {
    _instance ??= CommonPrint._internal();
    return _instance!;
  }

  File? _file;
  bool _initTried = false;

  Future<void> _ensureLogFile() async {
    if (_file != null || _initTried) return;
    _initTried = true;
    try {
      final dirPath = await appPath.homeDirPath; // Application Support/com.follow.clash
      final logFile = File("$dirPath/flutter_app.log");
      if (!await logFile.exists()) {
        await logFile.create(recursive: true);
      }
      _file = logFile;
    } catch (_) {
      // ignore file logging failures
    }
  }

  log(String? text) {
    final payload = "[FlClash] $text";
    debugPrint(payload);
    if (globalState.isService) {
      return;
    }
    globalState.appController.addLog(
      Log(
        logLevel: LogLevel.info,
        payload: payload,
      ),
    );

    // Append to local log file under Application Support
    () async {
      await _ensureLogFile();
      final f = _file;
      if (f == null) return;
      try {
        final ts = DateTime.now().toIso8601String();
        await f.writeAsString("$ts $payload\n", mode: FileMode.append, flush: false);
      } catch (_) {
        // ignore
      }
    }();
  }
}

final commonPrint = CommonPrint();
