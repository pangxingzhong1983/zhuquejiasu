import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:zhuquejiasu/providers/providers.dart';
import 'package:zhuquejiasu/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../login.dart';

class StartButton extends ConsumerStatefulWidget {
  const StartButton({super.key});

  @override
  StartButtonState createState() => StartButtonState();
}

class StartButtonState extends ConsumerState<StartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isStart = false;

  @override
  void initState() {
    super.initState();
    isStart = globalState.appState.runTime != null;
    _controller = AnimationController(
      vsync: this,
      value: isStart ? 1 : 0,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> handleSwitchStart() async {
    final member = ref.read(memberProvider); // 监听 memberProvider
    /// 如果未登录 则提示尚未登录 ，跳转到登录页
    if (member.id == -1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginFragment()),
      );
      return;
    }

    if (isStart != globalState.appState.isStart) {
      return;
    }
    final targetStart = !isStart;
    try {
      await globalState.appController.updateStatus(targetStart);
      if (!mounted) return;
      setState(() {
        isStart = targetStart;
      });
      updateController();
    } catch (e) {
      globalState.showNotifier('连接状态变更失败: $e');
    }
  }

  updateController() {
    if (isStart) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, child) {
        final state = ref.watch(startButtonSelectorStateProvider);
        if (!state.isInit || !state.hasProfile) {
          return Container();
        }
        ref.listenManual(
          runTimeProvider.select((state) => state != null),
          (prev, next) {
            if (next != isStart) {
              isStart = next;
              updateController();
            }
          },
          fireImmediately: true,
        );
        final textWidth = globalState.measure
                .computeTextSize(
                  Text(
                    other.getTimeDifference(
                      DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.titleMedium?.toSoftBold,
                  ),
                )
                .width +
            16;
        return AnimatedBuilder(
          animation: _controller.view,
          builder: (_, child) {
            return SizedBox(
              width: 56 + textWidth * _controller.value,
              height: 56,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () async {
                  await handleSwitchStart();
                },
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      alignment: Alignment.center,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: _controller,
                      ),
                    ),
                    Expanded(
                      child: ClipRect(
                        child: OverflowBox(
                          maxWidth: textWidth,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: child!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: child,
        );
      },
      child: Consumer(
        builder: (_, ref, __) {
          final runTime = ref.watch(runTimeProvider);
          final text = other.getTimeText(runTime);
          return Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.toSoftBold,
          );
        },
      ),
    );
  }
}
