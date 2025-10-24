import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'constant.dart';

class AppPath {
  static AppPath? _instance;
  Completer<Directory> dataDir = Completer();
  Completer<Directory> downloadDir = Completer();
  Completer<Directory> tempDir = Completer();
  late String appDirPath;

  AppPath._internal() {
    appDirPath = join(dirname(Platform.resolvedExecutable));
    _safeCompleteDirectory(
      completer: dataDir,
      supplier: getApplicationSupportDirectory,
      fallbackName: 'app-data',
    );
    _safeCompleteDirectory(
      completer: tempDir,
      supplier: getTemporaryDirectory,
      fallbackName: 'tmp',
    );
    _safeCompleteDirectory(
      completer: downloadDir,
      supplier: getDownloadsDirectory,
      fallbackName: 'downloads',
    );
  }

  factory AppPath() {
    _instance ??= AppPath._internal();
    return _instance!;
  }

  String get executableExtension {
    return Platform.isWindows ? ".exe" : "";
  }

  String get executableDirPath {
    final currentExecutablePath = Platform.resolvedExecutable;
    return dirname(currentExecutablePath);
  }

  String get corePath {
    return join(executableDirPath, "ZhuqueJiasuCore$executableExtension");
  }

  String get helperPath {
    return join(executableDirPath, "$appHelperService$executableExtension");
  }

  Future<String> get downloadDirPath async {
    final directory = await downloadDir.future;
    return directory.path;
  }

  Future<String> get homeDirPath async {
    final directory = await dataDir.future;
    return directory.path;
  }

  Future<String> get lockFilePath async {
    final directory = await dataDir.future;
    return join(directory.path, "ZhuqueJiasu.lock");
  }

  Future<String> get sharedPreferencesPath async {
    final directory = await dataDir.future;
    return join(directory.path, "shared_preferences.json");
  }

  Future<String> get profilesPath async {
    final directory = await dataDir.future;
    return join(directory.path, profilesDirectoryName);
  }

  Future<String?> getProfilePath(String? id) async {
    if (id == null) return null;
    final directory = await profilesPath;
    return join(directory, "$id.yaml");
  }

  Future<String?> getProvidersPath(String? id) async {
    if (id == null) return null;
    final directory = await profilesPath;
    return join(directory, "providers", id);
  }

  Future<String> get tempPath async {
    final directory = await tempDir.future;
    return directory.path;
  }

  void _safeCompleteDirectory({
    required Completer<Directory> completer,
    required Future<Directory?> Function() supplier,
    required String fallbackName,
  }) {
    if (system.isHarmony) {
      _createFallbackDirectory(fallbackName).then((dir) {
        if (!completer.isCompleted) {
          completer.complete(dir);
        }
      }).catchError((error, stackTrace) {
        if (!completer.isCompleted) {
          completer.completeError(error, stackTrace);
        }
      });
      return;
    }
    supplier()
        .then((dir) {
          if (!completer.isCompleted) {
            if (dir != null) {
              completer.complete(dir);
            } else {
              throw MissingPluginException('Directory supplier returned null');
            }
          }
        })
        .catchError((error, stackTrace) async {
          if (completer.isCompleted) {
            return;
          }
          const logName = 'AppPath';
          final message =
              "Failed to resolve directory via plugin ($fallbackName): $error";
          debugPrint("[$logName] $message");
          developer.log(
            message,
            name: logName,
            error: error,
            stackTrace: stackTrace,
          );
          if (error is MissingPluginException) {
            const missingMessage =
                "Missing plugin for requested directory, using fallback.";
            debugPrint("[$logName] $missingMessage");
            developer.log(missingMessage, name: logName);
          }
          try {
            final fallback = await _createFallbackDirectory(fallbackName);
            completer.complete(fallback);
          } catch (fallbackError, fallbackStack) {
            final fallbackMessage =
                "Fallback directory creation failed: $fallbackError";
            debugPrint("[$logName] $fallbackMessage");
            developer.log(
              fallbackMessage,
              name: logName,
              error: fallbackError,
              stackTrace: fallbackStack,
            );
            completer.completeError(fallbackError, fallbackStack);
          }
        });
  }

  Future<Directory> _createFallbackDirectory(String name) async {
    final sandbox = Directory('/data/storage/el2/base/haps/entry/files');
    Directory baseDirectory;
    if (await sandbox.exists()) {
      baseDirectory = Directory(join(sandbox.path, 'zhuquejiasu', name));
    } else {
      baseDirectory = Directory(
        join(Directory.systemTemp.path, 'zhuquejiasu', name),
      );
    }
    if (!await baseDirectory.exists()) {
      await baseDirectory.create(recursive: true);
    }
    const logName = 'AppPath';
    final resolved = "Using fallback directory: ${baseDirectory.path}";
    debugPrint("[$logName] $resolved");
    developer.log(resolved, name: logName);
    return baseDirectory;
  }
}

final appPath = AppPath();
