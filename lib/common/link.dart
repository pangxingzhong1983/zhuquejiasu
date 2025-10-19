import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/services.dart';
import 'package:zhuquejiasu/common/system.dart';

import 'print.dart';

typedef InstallConfigCallBack = void Function(String url);

class LinkManager {
  static LinkManager? _instance;
  AppLinks? _appLinks;
  StreamSubscription? subscription;

  LinkManager._internal() {
    if (system.isHarmony) {
      commonPrint.log("App links not supported on HarmonyOS; skipping init.");
      return;
    }
    try {
      _appLinks = AppLinks();
    } on MissingPluginException catch (error, stackTrace) {
      commonPrint.log("AppLinks initialization failed: $error");
      commonPrint.log("AppLinks stack:\n$stackTrace");
      _appLinks = null;
    } catch (error, stackTrace) {
      commonPrint.log("AppLinks unexpected init error: $error");
      commonPrint.log("AppLinks unexpected stack:\n$stackTrace");
      _appLinks = null;
    }
  }

  initAppLinksListen(installConfigCallBack) async {
    commonPrint.log("initAppLinksListen");
    if (_appLinks == null) {
      commonPrint.log("AppLinks stream unavailable; listener not installed.");
      return;
    }
    destroy();
    subscription = _appLinks!.uriLinkStream.listen(
      (uri) {
        commonPrint.log('onAppLink: $uri');
        if (uri.host == 'install-config') {
          final parameters = uri.queryParameters;
          final url = parameters['url'];
          if (url != null) {
            installConfigCallBack(url);
          }
        }
      },
    );
  }

  destroy() {
    if (subscription != null) {
      subscription?.cancel();
      subscription = null;
    }
  }

  factory LinkManager() {
    _instance ??= LinkManager._internal();
    return _instance!;
  }
}

final linkManager = LinkManager();
