import 'dart:io';

import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/state.dart';

class ZhuqueJiasuHttpOverrides extends HttpOverrides {
  static String handleFindProxy(
    Uri url, {
    bool forceProxy = false,
  }) {
    if ([localhost].contains(url.host)) {
      return "DIRECT";
    }
    final port = globalState.config.patchClashConfig.mixedPort;
    final isStart = forceProxy ? true : globalState.isStart;
    commonPrint.log("find $url proxy:$isStart");
    if (!isStart) return "DIRECT";
    return "PROXY localhost:$port";
  }

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.findProxy = handleFindProxy;
    return client;
  }
}
