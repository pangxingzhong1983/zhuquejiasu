import 'dart:io';
import 'package:zhuquejiasu/state.dart';
import 'package:flutter/widgets.dart';

class BackScope extends StatefulWidget {
  final Widget child;

  const BackScope({super.key, required this.child});

  @override
  State<BackScope> createState() => _PopContainerState();
}

class _PopContainerState extends State<BackScope> {
  @override
  Widget build(BuildContext context) {
    final isAndroidLike =
        Platform.isAndroid || Platform.operatingSystem.toLowerCase() == 'ohos';
    if (isAndroidLike) {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) async {
          final canPop = Navigator.canPop(context);
          if (canPop) {
            Navigator.pop(context);
          } else {
            await globalState.appController.handleBackOrExit();
          }
        },
        child: widget.child,
      );
    }
    return widget.child;
  }
}
