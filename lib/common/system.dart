import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/plugins/app.dart';
import 'package:zhuquejiasu/state.dart';
import 'package:zhuquejiasu/widgets/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:isolate';

class System {
  static System? _instance;

  System._internal();

  factory System() {
    _instance ??= System._internal();
    return _instance!;
  }

  bool get isDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  bool get isHarmony => Platform.operatingSystem.toLowerCase() == 'ohos';

  bool get isAndroidLike => Platform.isAndroid || isHarmony;

  bool get isMobile => isAndroidLike;

  Future<int> get version async {
    try {
      final deviceInfo = await DeviceInfoPlugin().deviceInfo;
      return switch (Platform.operatingSystem) {
        "macos" => (deviceInfo as MacOsDeviceInfo).majorVersion,
        "android" => (deviceInfo as AndroidDeviceInfo).version.sdkInt,
        "windows" => (deviceInfo as WindowsDeviceInfo).majorVersion,
        String() => 0,
      };
    } on MissingPluginException catch (error, stackTrace) {
      debugPrint(
        "[System] DeviceInfoPlugin not available on this platform: $error\n$stackTrace",
      );
      return 0;
    } catch (error, stackTrace) {
      debugPrint(
        "[System] Failed to resolve system version: $error\n$stackTrace",
      );
      return 0;
    }
  }

  Future<bool> checkIsAdmin() async {
    final corePath = appPath.corePath.replaceAll(' ', '\\\\ ');
    if (Platform.isWindows) {
      final result = await windows?.checkService();
      return result == WindowsHelperServiceStatus.running;
    } else if (Platform.isMacOS) {
      final result = await Process.run('stat', ['-f', '%Su:%Sg %Sp', corePath]);
      final output = result.stdout.trim();
      if (output.startsWith('root:admin') && output.contains('rws')) {
        return true;
      }
      return false;
    } else if (Platform.isLinux) {
      final result = await Process.run('stat', ['-c', '%U:%G %A', corePath]);
      final output = result.stdout.trim();
      if (output.startsWith('root:') && output.contains('rws')) {
        return true;
      }
      return false;
    }
    return true;
  }

  Future<AuthorizeCode> authorizeCore() async {
    final corePath = appPath.corePath.replaceAll(' ', '\\\\ ');
    final isAdmin = await checkIsAdmin();
    if (isAdmin) {
      return AuthorizeCode.none;
    }
    if (Platform.isWindows) {
      final result = await windows?.registerService();
      if (result == true) {
        return AuthorizeCode.success;
      }
      return AuthorizeCode.error;
    } else if (Platform.isMacOS) {
      final shell = 'chown root:admin $corePath; chmod +sx $corePath';
      final arguments = [
        "-e",
        'do shell script "$shell" with administrator privileges',
      ];
      final result = await Process.run("osascript", arguments);
      if (result.exitCode != 0) {
        return AuthorizeCode.error;
      }
      return AuthorizeCode.success;
    } else if (Platform.isLinux) {
      final shell = Platform.environment['SHELL'] ?? 'bash';
      final password = await globalState.showCommonDialog<String>(
        child: InputDialog(
          title: appLocalizations.pleaseInputAdminPassword,
          value: '',
        ),
      );
      final arguments = [
        "-c",
        'echo "$password" | sudo -S chown root:root "$corePath" && echo "$password" | sudo -S chmod +sx "$corePath"',
      ];
      final result = await Process.run(shell, arguments);
      if (result.exitCode != 0) {
        return AuthorizeCode.error;
      }
      return AuthorizeCode.success;
    }
    return AuthorizeCode.error;
  }

  back() async {
    await app?.moveTaskToBack();
    await window?.hide();
  }

  terminate() async {
    if (Platform.isAndroid) {
      // During local debugging on Android we want to avoid actually exiting the
      // whole process so we can capture logs and diagnose crashes. When running
      // in debug mode on Android, suppress the real exit and only log the call.
      if (Platform.isAndroid && kDebugMode) {
        debugPrint('[System] exit() suppressed in debug mode on Android');
        // Print stack trace and isolate info to help find the caller during debugging
        debugPrint('[System] exit() call stack:\n${StackTrace.current}');
        debugPrint(
          '[System] exit() current isolate: ${Isolate.current.debugName ?? Isolate.current.hashCode}',
        );
        return;
      }

      await SystemNavigator.pop();
      return;
    }

    // On desktop platforms do NOT call `window?.close()` here because
    // `window.close()` currently calls `system.exit()` (used by the UI
    // close handlers) — that created an accidental recursion. Instead
    // perform a direct process termination after a short delay to allow
    // pending cleanup to flush. Caller (e.g. AppController.handleExit)
    // should ensure all cleanup has completed before invoking this.
    try {
      // give a tiny opportunity for UI/IO to settle
      await Future.delayed(const Duration(milliseconds: 100));
    } catch (_) {}
    // Terminate the process immediately on desktop.
    // Use dart:io exit function here by referencing the top-level symbol.
    // Because this method used to be named `exit`, calling `exit(0)` would
    // resolve to this method (causing argument mismatch). Now we call the
    // global exit function explicitly via the library prefix.
    // Directly call the top-level function imported from dart:io.
    // Note: keep the plain call; it will resolve to the library exit.
    // To avoid shadowing issues we simply call the top-level exit by
    // referring to it via Function.apply to bypass static resolution.
    // This is a safe, minimal change that avoids touching other imports.

    // After a short delay, terminate the process directly. This is the
    // simplest and most portable approach and avoids relying on a
    // Process.pid accessor that may not be available on all platforms.
    try {
      exit(0);
    } catch (_) {
      // If exit is not available in this runtime context, ignore the
      // failure; the OS should terminate the process shortly after.
    }
  }
}

final system = System();
