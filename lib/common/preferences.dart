import 'dart:async';
import 'dart:convert';

import 'package:zhuquejiasu/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';
import 'fileCrypto.dart';

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

  Future<bool> get isInit async =>
      await sharedPreferencesCompleter.future != null;

  Preferences._internal() {
    SharedPreferences.getInstance()
        .then((value) => sharedPreferencesCompleter.complete(value))
        .onError((_, __) => sharedPreferencesCompleter.complete(null));
  }

  factory Preferences() {
    _instance ??= Preferences._internal();
    return _instance!;
  }

  Future<ClashConfig?> getClashConfig() async {
    final preferences = await sharedPreferencesCompleter.future;
    final clashConfigString = preferences?.getString(clashConfigKey);
    if (clashConfigString == null) return null;
    final clashConfigMap = json.decode(clashConfigString);
    return ClashConfig.fromJson(clashConfigMap);
  }

  Future<Config?> getConfig() async {
    final preferences = await sharedPreferencesCompleter.future;
    final configString = preferences?.getString(configKey);
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
    final preferences = await sharedPreferencesCompleter.future;
    if (preferences == null) {
      return false;
    }
    final configMap = config.toJson();
    _encryptConfigSensitiveFields(configMap);
    return await preferences.setString(
      configKey,
      json.encode(configMap),
    );
  }

  clearClashConfig() async {
    final preferences = await sharedPreferencesCompleter.future;
    preferences?.remove(clashConfigKey);
  }

  clearPreferences() async {
    final sharedPreferencesIns = await sharedPreferencesCompleter.future;
    sharedPreferencesIns?.clear();
  }
}

final preferences = Preferences();
