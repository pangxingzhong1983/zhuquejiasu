import 'dart:math';

class URLManager {
  static final URLManager _instance = URLManager._internal();

  factory URLManager() {
    return _instance;
  }

  URLManager._internal() {
    _dynamicURL = _initDynamicURL();
  }

  late final String _dynamicURL;

  String get dynamicURL => _dynamicURL;

  String _initDynamicURL() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random.secure();
    final subdomain = List.generate(10, (_) => chars[rand.nextInt(chars.length)]).join();
    return 'https://$subdomain.myset.uk/';
  }
}