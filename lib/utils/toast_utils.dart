import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../res/styles.dart';

class ToastUtils {
  static void showToast(String msg) {
    if (msg.trim().isNotEmpty) EasyLoading.showToast(msg);
  }

  static void showError(String msg) {
    if (msg.trim().isNotEmpty) EasyLoading.showError(msg);
  }

  static void showSuccess(String msg) {
    if (msg.trim().isNotEmpty) EasyLoading.showSuccess(msg);
  }

  static showProgress(
      {double value = 0, String? msg = '上传中...', EasyLoadingMaskType? type}) {
    EasyLoading.showProgress(value, status: msg, maskType: type);
  }

  static void showLoading({String? status}) {
    EasyLoading.show(status: status ?? '请稍后...',maskType: EasyLoadingMaskType.black);
  }

  static void hideLoading() {
    EasyLoading.dismiss();
  }

  ///弹窗
  static Future showAlert({
    String? title,
    String? content,
    Widget? child,
    Widget? widget,
    String? textConfirm = '确定',
    String? textCancel = '取消',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    TextStyle? contentStyle,
    bool barrierDismissible = true,
    bool isAutoBack = true,
  }) {
    return Get.dialog(
        Dialog(
          // backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.antiAlias,
          child: child ??
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  if (title != null)
                    Text(
                      title,
                      style: TextStyles.text(16),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                  if (content != null)
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          content,
                          style: contentStyle ?? TextStyles.text(14),
                          textAlign: TextAlign.center,
                        )),
                  if (widget != null) widget,
                  const SizedBox(
                    height: 20,
                  ),
                  if (textConfirm != null || textCancel != null)
                    const Divider(
                      height: 1,
                    ),
                  if (textConfirm != null || textCancel != null)
                    SizedBox(
                      height: 46.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (textCancel != null)
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                if (isAutoBack) Get.back();
                                if (onCancel != null) {
                                  onCancel();
                                }
                              },
                              child: Container(
                                // color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  textCancel,
                                  style: TextStyles.text(
                                    14,
                                  ),
                                ),
                              ),
                            )),
                          const VerticalDivider(
                            width: 1,
                          ),
                          if (textConfirm != null)
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                if (isAutoBack) Get.back(result: 1);
                                if (onConfirm != null) {
                                  onConfirm();
                                }
                              },
                              child: Container(
                                // color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  textConfirm,
                                  style: TextStyles.text(14),
                                ),
                              ),
                            ))
                        ],
                      ),
                    )
                ],
              ),
        ),
        barrierDismissible: barrierDismissible);
  }

  ///弹窗
  static Future showTopDialog(
      {Widget? child, double? marginTop, bool barrierDismissible = true}) {
    return Get.dialog(
        Stack(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().statusBarHeight + 44 + (marginTop ?? 0)),
                height: 1.sh - 44 + (marginTop ?? 0),
                color: Colors.black26,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().statusBarHeight + 44 + (marginTop ?? 0)),
              // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              // decoration: const BoxDecoration(
              //     color: Colors.white,
              //     borderRadius:
              //         BorderRadius.vertical(bottom: Radius.circular(20))),
              width: double.infinity,
              child: child,
            ),
          ],
        ),
        barrierColor: Colors.transparent,
        barrierDismissible: barrierDismissible,
        useSafeArea: false);
  }









}
