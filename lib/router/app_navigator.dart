import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routers.dart';

class AppNavigator {

  static Future? toNamed(String path, {dynamic arguments, Map<String, String>? parameters ,bool preventDuplicates = true}) {
    if (AppEvent.onEvent(path)) {
      return null;
    }
    return Get.toNamed(path, arguments: arguments, parameters: parameters ,preventDuplicates: preventDuplicates);
  }

  static offNamed(String path, {dynamic arguments, Map<String, String>? parameters}) {
    if (AppEvent.onEvent(path)) {
      return null;
    }
    return Get.offNamed(path, arguments: arguments, parameters: parameters);
  }

  static Future? off(page, {dynamic arguments ,bool preventDuplicates = true}) {
    return Get.off(page ,arguments: arguments ,preventDuplicates: preventDuplicates);
  }

  static Future? to(page, {dynamic arguments ,bool preventDuplicates = true,bool isCanIntercept = true}) {
    print('page====${page.toString()}');
    if (isCanIntercept && canIntercept(page.toString())) {
      return null;
    }
    return Get.to(page ,arguments: arguments ,preventDuplicates: preventDuplicates);
  }

  static void back<T>({T? result,}) {
    Get.back(result: result);
  }



  ///登录页
  static void startLogin() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAllNamed(RouteGet.login);
    });
  }





  ///路由拦截
  static bool canIntercept(String name) {
    return false;
    // final user = Get.find<UserController>().user;
  }

  ///认证白名单
  static final List<String> authWhiteList = [
    'MyInfoEditorPage',
    'AuthPage',
    'RealNamePage',
    'ChatPage',
    'WebViewPage',
    'GlobalSearchPage',
    'SettingPage',
    'LoginPage',
    'CaptchaLoginPage',
    'MomentsHomePage'
  ];

}

extension AppEvent on AppNavigator {

  static final Map<String,EventBuilder> getEvents = {
    'closeMiniProgram' : ()=>(map) async {

      return;
    }
  };

  static bool onEvent(String path) {
    final path1 = path.contains('?') ? path.split('?')[0] : path;
    if (getEvents[path1] != null) {
      getEvents[path1]!()!(getUrlParameter(path));
      return true;
    }
    return false;
  }

  static Map<String, String>? getUrlParameter(String? path) {
    if (path != null) {
      final map = Uri.dataFromString(Uri.encodeComponent(path)).queryParameters;
      return map.isNotEmpty ? map : null;
    }
    return null;
  }

}

typedef EventBuilder = Function(Map<String, String>?)? Function();