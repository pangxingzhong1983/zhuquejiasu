import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:zhuquejiasu/state.dart';
import 'package:flutter/cupertino.dart';

class CommonPrint {
  static CommonPrint? _instance;

  CommonPrint._internal();

  factory CommonPrint() {
    _instance ??= CommonPrint._internal();
    return _instance!;
  }

  log(String? text) {
    final payload = "[ZhuqueJiasu] $text";
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
  }
}

final commonPrint = CommonPrint();
