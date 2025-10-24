import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';
import 'file_crypto.dart';

const _encryptedPrefix = 'enc::';

bool _isEncryptedString(Object? value) {
  return value is String && value.startsWith(_encryptedPrefix);
}

String _encryptString(String value) {
  if (value.isEmpty) {
    return value;
  }
  if (_isEncryptedString(value)) {
    return value;
  }
  final encrypted = FileCrypto.encryptContent(value);
  return '$_encryptedPrefix$encrypted';
}

String _decryptString(String value) {
  if (!_isEncryptedString(value)) {
    return value;
  }
  final payload = value.substring(_encryptedPrefix.length);
  return FileCrypto.decryptContent(payload);
}

void _encryptConfigSensitiveFields(Map<String, dynamic> configMap) {
  final profiles = configMap['profiles'];
  if (profiles is List) {
    for (final profile in profiles) {
      if (profile is Map<String, dynamic>) {
        final url = profile['url'];
        if (url is String && url.isNotEmpty) {
          profile['url'] = _encryptString(url);
        }
      }
    }
  }
  final dav = configMap['dav'];
  if (dav is Map<String, dynamic>) {
    final uri = dav['uri'];
    if (uri is String && uri.isNotEmpty) {
      dav['uri'] = _encryptString(uri);
    }
    final user = dav['user'];
    if (user is String && user.isNotEmpty) {
      dav['user'] = _encryptString(user);
    }
    final password = dav['password'];
    if (password is String && password.isNotEmpty) {
      dav['password'] = _encryptString(password);
    }
  }
}

void _decryptConfigSensitiveFields(Map<String, dynamic> configMap) {
  final profiles = configMap['profiles'];
  if (profiles is List) {
    for (final profile in profiles) {
      if (profile is Map<String, dynamic>) {
        final url = profile['url'];
        if (url is String && url.isNotEmpty) {
          profile['url'] = _decryptString(url);
        }
      }
    }
  }
  final dav = configMap['dav'];
  if (dav is Map<String, dynamic>) {
    final uri = dav['uri'];
    if (uri is String && uri.isNotEmpty) {
      dav['uri'] = _decryptString(uri);
    }
    final user = dav['user'];
    if (user is String && user.isNotEmpty) {
      dav['user'] = _decryptString(user);
    }
    final password = dav['password'];
    if (password is String && password.isNotEmpty) {
      dav['password'] = _decryptString(password);
    }
  }
}

class Preferences {
  static Preferences? _instance;
  Completer<SharedPreferences?> sharedPreferencesCompleter = Completer();
  bool _useFallback = false;
  Map<String, Object?> _memoryStore = {};

  Future<bool> get isInit async =>
      _useFallback || await sharedPreferencesCompleter.future != null;

  Preferences._internal() {
    SharedPreferences.getInstance()
        .then((value) {
          sharedPreferencesCompleter.complete(value);
        })
        .onError((error, stackTrace) async {
          _useFallback = true;
          await _loadFallback();
          sharedPreferencesCompleter.complete(null);
        });
  }

  factory Preferences() {
    _instance ??= Preferences._internal();
    return _instance!;
  }

  Future<void> _loadFallback() async {
    try {
      final file = File(await appPath.sharedPreferencesPath);
      if (await file.exists()) {
        final content = await file.readAsString();
        if (content.isNotEmpty) {
          final decoded = json.decode(content);
          if (decoded is Map<String, dynamic>) {
            _memoryStore = decoded;
          }
        }
      }
    } catch (_) {
      _memoryStore = {};
    }
  }

  Future<void> _persistFallback() async {
    try {
      final file = File(await appPath.sharedPreferencesPath);
      if (!await file.parent.exists()) {
        await file.parent.create(recursive: true);
      }
      await file.writeAsString(json.encode(_memoryStore), flush: true);
    } catch (_) {
      // best effort persistence
    }
  }

  Future<String?> _readString(String key) async {
    if (_useFallback) {
      final value = _memoryStore[key];
      return value is String ? value : null;
    }
    final preferences = await sharedPreferencesCompleter.future;
    return preferences?.getString(key);
  }

  Future<void> _writeString(String key, String value) async {
    if (_useFallback) {
      _memoryStore[key] = value;
      await _persistFallback();
      return;
    }
    final preferences = await sharedPreferencesCompleter.future;
    if (preferences == null) {
      return;
    }
    await preferences.setString(key, value);
  }

  Future<ClashConfig?> getClashConfig() async {
    if (_useFallback) {
      final clashConfigString = _memoryStore[clashConfigKey] as String?;
      if (clashConfigString == null) return null;
      final clashConfigMap = json.decode(clashConfigString);
      return ClashConfig.fromJson(clashConfigMap);
    }
    final preferences = await sharedPreferencesCompleter.future;
    final clashConfigString = preferences?.getString(clashConfigKey);
    if (clashConfigString == null) return null;
    final clashConfigMap = json.decode(clashConfigString);
    return ClashConfig.fromJson(clashConfigMap);
  }

  Future<Config?> getConfig() async {
    String? configString;
    if (_useFallback) {
      configString = _memoryStore[configKey] as String?;
    } else {
      final preferences = await sharedPreferencesCompleter.future;
      configString = preferences?.getString(configKey);
    }
    if (configString == null) return null;
    final configMap = json.decode(configString);
    if (configMap is Map<String, dynamic>) {
      _decryptConfigSensitiveFields(configMap);
      return Config.compatibleFromJson(configMap);
    }
    if (configMap is Map) {
      final map = Map<String, dynamic>.from(configMap);
      _decryptConfigSensitiveFields(map);
      return Config.compatibleFromJson(map);
    }
    return Config.compatibleFromJson(configMap);
  }

  Future<bool> saveConfig(Config config) async {
    final configMap = config.toJson();
    _encryptConfigSensitiveFields(configMap);
    final encoded = json.encode(configMap);
    if (_useFallback) {
      _memoryStore[configKey] = encoded;
      await _persistFallback();
      return true;
    }
    final preferences = await sharedPreferencesCompleter.future;
    if (preferences == null) {
      return false;
    }
    return await preferences.setString(configKey, encoded);
  }

  Future<DateTime?> getGeoAssetsLastUpdate() async {
    final raw = await _readString(geoLastUpdateKey);
    if (raw == null || raw.isEmpty) {
      return null;
    }
    try {
      return DateTime.parse(raw).toLocal();
    } catch (_) {
      return null;
    }
  }

  Future<void> setGeoAssetsLastUpdate(DateTime timestamp) async {
    await _writeString(geoLastUpdateKey, timestamp.toUtc().toIso8601String());
  }

  clearClashConfig() async {
    if (_useFallback) {
      _memoryStore.remove(clashConfigKey);
      await _persistFallback();
      return;
    }
    final preferences = await sharedPreferencesCompleter.future;
    preferences?.remove(clashConfigKey);
  }

  clearPreferences() async {
    if (_useFallback) {
      _memoryStore.clear();
      await _persistFallback();
      return;
    }
    final sharedPreferencesIns = await sharedPreferencesCompleter.future;
    sharedPreferencesIns?.clear();
  }
}

final preferences = Preferences();
