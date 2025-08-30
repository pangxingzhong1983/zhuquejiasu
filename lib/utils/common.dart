import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:fl_clash/utils/toast_utils.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// lib/utils/sputil.dart   本地存储
///  使用方式 存 SpUtil.putString("username", "userName");  取 SpUtil.getString("userName",defValue: "userName");
///  lib/net/dioutils.dart   网络请求类
///  示例 [onSuccess]为请求成功的callback,返回Map,再调用处使用 实体类.fromJson(data)转化
///  [onError]为请求失败的callback  默认处理了错误码,如果需要自定义处理,请实现[onError]
///  DioUtils.instance.request(Method.get, "/user/login",queryParameters:{"name":"","password":""},onSuccess: (data) {})
///  DioUtils.instance.request(Method.post, "/user/login",data:{"name":"","password":""},onSuccess: (data) {})

BuildContext? _context;


Widget _buildMaterialDialogTransitions(BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<T?> showTransparentDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder? builder,
}) {
  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder!);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return Theme(data: theme, child: pageChild);
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations
        .of(context)
        .modalBarrierDismissLabel,
    barrierColor: const Color(0x00FFFFFF),
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

/// loading  需要context
void showProgress(BuildContext context,
    {bool barrierDismissible = false, String? hint}) {
  ToastUtils.showLoading(status: hint);
  // _context = context;
  // showTransparentDialog(
  //     context: context,
  //     barrierDismissible: barrierDismissible,
  //     builder: (_) {
  //       return WillPopScope(
  //         onWillPop: () async {
  //           // 拦截到返回键，证明dialog被手动关闭
  //           return Future.value(true);
  //         },
  //         child: ProgressDialog(hintText: hint ?? '请稍后...'),
  //       );
  //     });
}

void dismissProgress() {
  EasyLoading.dismiss();
  if (_context != null) {
    Navigator.pop(_context!);
    _context = null;
  }
}

/// toast
void toast(String msg) {
  ToastUtils.showToast(msg);
}

void imt1(String value, List para) {

}

/// md5
String generateMD5(String data) {
  Uint8List content = const Utf8Encoder().convert(data);
  Digest digest = md5.convert(content);
  return digest.toString();
}
