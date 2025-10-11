import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/providers/app.dart';
import 'package:zhuquejiasu/providers/state.dart';
import 'package:zhuquejiasu/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VpnManager extends ConsumerStatefulWidget {
  final Widget child;

  const VpnManager({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<VpnManager> createState() => _VpnContainerState();
}

class _VpnContainerState extends ConsumerState<VpnManager> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(vpnStateProvider, (prev, next) {
      showTip();
    });
  }

  showTip() {
    debouncer.call(
      DebounceTag.vpnTip,
      () {
        if (ref.read(runTimeProvider.notifier).isStart) {
          globalState.showNotifier(
            appLocalizations.vpnTip,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
