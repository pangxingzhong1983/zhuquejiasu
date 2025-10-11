import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:zhuquejiasu/state.dart';
import 'package:flutter/cupertino.dart';

import '../enum/enum.dart';
import '../net/api.dart';
import '../net/dioutils.dart';

class Request {
  late final Dio _dio;
  late final Dio _clashDio;
  String? userAgent;

  Request() {
    _dio = Dio(
      BaseOptions(
        headers: {
          "User-Agent": browserUa,
        },
      ),
    );
    _clashDio = Dio();
    _clashDio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
      final client = HttpClient();
      client.findProxy = (Uri uri) {
        client.userAgent = globalState.ua;
        return ZhuqueJiasuHttpOverrides.handleFindProxy(uri);
      };
      return client;
    });
  }

  Future<Response> getFileResponseForUrl(String url) async {
    final response = await _clashDio.get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    return response;
  }

  Future<MemoryImage?> getImage(String url) async {
    if (url.isEmpty) return null;
    final response = await _dio.get<Uint8List>(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    final data = response.data;
    if (data == null) return null;
    return MemoryImage(data);
  }

  Future<dynamic> getShort(String url) async {
    var response = await DioUtils.instance
        .request(Method.post, Api.getShort, autoDismiss: false,params: {'url' :url });
    if (response['code'] != 200) return null;
    final data = response['data'] ;
    final resultUrl = data['url'];
    await Future.delayed(const Duration(seconds: 1));
    return resultUrl;
  }

  Future<dynamic> checkForUpdate() async {
    // final response = await _dio.get(
    //   "https://api.github.com/repos/$repository/releases/latest",
    //   options: Options(
    //     responseType: ResponseType.json,
    //   ),
    // );
    var response = await DioUtils.instance
        .request(Method.post, Api.checkUpdate, autoDismiss: false,params: {'platform' :SupportPlatform.currentPlatform.name });
    if (response['code'] != 200) return null;
    final data = response['data'] ;
    final remoteVersion = data['version'];
    final version = globalState.packageInfo.version;
    final hasUpdate = remoteVersion != version;

    if (!hasUpdate) return null;
    return data;
  }

  final Map<String, IpInfo Function(Map<String, dynamic>)> _ipInfoSources = {
    "https://ipwho.is/": IpInfo.fromIpwhoIsJson,
    "https://api.ip.sb/geoip/": IpInfo.fromIpSbJson,
    "https://ipapi.co/json/": IpInfo.fromIpApiCoJson,
    "https://ipinfo.io/json/": IpInfo.fromIpInfoIoJson,
  };

  Future<IpInfo?> checkIp({CancelToken? cancelToken}) async {
    return null;
    for (final source in _ipInfoSources.entries) {
      try {
        final response = await _dio.get<Map<String, dynamic>>(
          source.key,
          cancelToken: cancelToken,
          options: Options(
            responseType: ResponseType.json,
            receiveTimeout: const Duration(seconds: 3), // 接收超时时间
          ),
        );
        if (response.statusCode != 200 || response.data == null) {
          continue;
        }
        if (response.data == null) {
          continue;
        }
        return source.value(response.data!);
      } catch (e) {
        commonPrint.log("checkIp error ===> $e");
        if (e is DioException && e.type == DioExceptionType.cancel) {
          throw "cancelled";
        }
      }
    }
    return null;
  }

  Future<bool> pingHelper() async {
    try {
      final response = await _dio
          .get(
            "http://$localhost:$helperPort/ping",
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(
            const Duration(
              milliseconds: 2000,
            ),
          );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
      return (response.data as String) == helperTag;
    } catch (_) {
      return false;
    }
  }

  Future<bool> startCoreByHelper(String arg) async {
    try {
      final response = await _dio
          .post(
            "http://$localhost:$helperPort/start",
            data: json.encode({
              "path": appPath.corePath,
              "arg": arg,
            }),
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(
            const Duration(
              milliseconds: 2000,
            ),
          );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
      final data = response.data as String;
      return data.isEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<bool> stopCoreByHelper() async {
    try {
      final response = await _dio
          .post(
            "http://$localhost:$helperPort/stop",
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(
            const Duration(
              milliseconds: 2000,
            ),
          );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
      final data = response.data as String;
      return data.isEmpty;
    } catch (_) {
      return false;
    }
  }
}

final request = Request();
