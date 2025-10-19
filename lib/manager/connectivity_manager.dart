import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:zhuquejiasu/common/system.dart';

class ConnectivityManager extends StatefulWidget {
  final VoidCallback? onConnectivityChanged;
  final Widget child;

  const ConnectivityManager({
    super.key,
    this.onConnectivityChanged,
    required this.child,
  });

  @override
  State<ConnectivityManager> createState() => _ConnectivityManagerState();
}

class _ConnectivityManagerState extends State<ConnectivityManager> {
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    if (system.isHarmony) {
      return;
    }
    subscription = Connectivity().onConnectivityChanged.listen((_) async {
      if (widget.onConnectivityChanged != null) {
        widget.onConnectivityChanged!();
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
