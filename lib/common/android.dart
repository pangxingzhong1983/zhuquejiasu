import 'dart:io';

import 'package:zhuquejiasu/plugins/app.dart';
import 'package:zhuquejiasu/state.dart';

class Android {
  init() async {
    app?.onExit = () async {
      await globalState.appController.savePreferences();
    };
  }
}

final android = Platform.isAndroid ? Android() : null;
