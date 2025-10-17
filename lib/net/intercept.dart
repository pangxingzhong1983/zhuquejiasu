import 'dart:convert';
import 'dart:io';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';
import 'error_handle.dart';

class HeaderInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 添加header
    LogUtil.d("请求头token------${SpUtil.getString("token")}");
    Map<String, String> headers = {
      'platform': Platform.isAndroid
          ? 'android'
          : Platform.isIOS
              ? 'ios'
              : 'web',
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      'lang': {
            'en': 'en_US',
            'zh-Hans': 'zh_CN',
            'zh-Hant': 'zh_TW'
          }['zh-Hans'] ??
          'zh_CN',
    };

    if (SpUtil.getString("token")!.isNotEmpty) {
      headers['Authorization'] = "Bearer ${SpUtil.getString("token")}";
    }
    options.headers = headers;
    return super.onRequest(options, handler);
  }
}

class LoggingInterceptor extends Interceptor {
  late DateTime startTime;
  late DateTime endTime;

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    LogUtil.d("----------Start----------");
    if (options.queryParameters.isEmpty) {
      LogUtil.d("RequestUrl: ${options.baseUrl}${options.path}");
    } else {
      LogUtil.d("RequestUrl: ${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}");
    }
    LogUtil.d("RequestMethod: ${options.method}");
    LogUtil.d("RequestHeaders:${jsonEncode(options.headers)}");
    LogUtil.d("RequestContentType: ${options.contentType}");
    LogUtil.d("RequestData: ${options.data.toString()}");
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    endTime = DateTime.now();
    int duration = endTime.difference(startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      LogUtil.d("ResponseCode: ${response.statusCode}");
    } else {
      LogUtil.d("ResponseCode: ${response.statusCode}");
    }
    // 输出结果
    LogUtil.d(response.data.toString());
    LogUtil.d("----------End: $duration 毫秒----------");
    return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    LogUtil.d("----------Error-----------");
    return super.onError(err, handler);
  }
}
