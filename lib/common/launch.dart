import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:launch_at_startup/launch_at_startup.dart';

import 'constant.dart';
import 'system.dart';

class AutoLaunch {
  static AutoLaunch? _instance;
  bool _pluginAvailable = true;

  AutoLaunch._internal() {
    try {
      launchAtStartup.setup(
        appName: appName,
        appPath: Platform.resolvedExecutable,
      );
    } on MissingPluginException catch (error, stackTrace) {
      _handlePluginError(
        reason: 'setup',
        error: error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      _handlePluginError(
        reason: 'setup',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  factory AutoLaunch() {
    _instance ??= AutoLaunch._internal();
    return _instance!;
  }

  Future<bool> get isEnable async {
    return _invokeWithFallback(
      action: 'isEnabled',
      fallbackValue: false,
      call: () => launchAtStartup.isEnabled(),
    );
  }

  Future<bool> enable() async {
    return _invokeWithFallback(
      action: 'enable',
      fallbackValue: false,
      call: () => launchAtStartup.enable(),
    );
  }

  Future<bool> disable() async {
    return _invokeWithFallback(
      action: 'disable',
      fallbackValue: false,
      call: () => launchAtStartup.disable(),
    );
  }

  Future<void> updateStatus(bool isAutoLaunch) async {
    if (await isEnable == isAutoLaunch) return;
    if (isAutoLaunch == true) {
      await enable();
    } else {
      await disable();
    }
  }

  Future<bool> _invokeWithFallback({
    required String action,
    required bool fallbackValue,
    required Future<bool> Function() call,
  }) async {
    if (!_pluginAvailable) {
      return fallbackValue;
    }
    try {
      return await call();
    } on MissingPluginException catch (error, stackTrace) {
      _handlePluginError(
        reason: action,
        error: error,
        stackTrace: stackTrace,
      );
      return fallbackValue;
    } catch (error, stackTrace) {
      _handlePluginError(
        reason: action,
        error: error,
        stackTrace: stackTrace,
      );
      return fallbackValue;
    }
  }

  void _handlePluginError({
    required String reason,
    required Object error,
    required StackTrace stackTrace,
  }) {
    _pluginAvailable = false;
    debugPrint(
      '[AutoLaunch] launch_at_startup plugin unavailable during $reason: $error',
    );
    debugPrintStack(
      label: '[AutoLaunch] stack trace',
      stackTrace: stackTrace,
    );
  }
}

final autoLaunch = system.isDesktop ? AutoLaunch() : null;
