import 'dart:convert';
import 'dart:io';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:sp_util/sp_util.dart';
import '../router/app_navigator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../utils/common.dart';
import '../utils/toast_utils.dart';
import '../utils/url_manager.dart';
import 'error_handle.dart';
import 'intercept.dart';
import '../state.dart';
import '../common/http.dart';

/// count 当前下载进度
/// total 下载总长度
typedef DownloadProgressCallBack = Function(int count, int total);

class DioUtils {
  static final DioUtils _singleton = DioUtils._internal();

  static DioUtils get instance => DioUtils();

  factory DioUtils() {
    return _singleton;
  }

  static Dio? _dio;
  static Dio? _proxyDio;

  Dio? getDio() {
    return _dio;
  }

  DioUtils._internal() {
    final options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
      responseType: ResponseType.plain,
      validateStatus: (status) {
        return true;
      },
      // baseUrl: baseUrl,
      baseUrl: URLManager().dynamicURL,
    );
    _dio = Dio(options);
    _proxyDio = Dio(options);

    /// 统一添加身份验证请求头
    _dio!.interceptors.add(HeaderInterceptor());
    _proxyDio!.interceptors.add(HeaderInterceptor());

    /// 添加log拦截器
    _dio!.interceptors.add(LoggingInterceptor());
    _proxyDio!.interceptors.add(LoggingInterceptor());

    _proxyDio!.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) =>
            ZhuqueJiasuHttpOverrides.handleFindProxy(uri, forceProxy: true);
        return client;
      },
    );
  }

  // 数据返回格式统一，统一处理异常
  Future<Response> _request(String? method, String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      bool autoDismiss = true,
      bool forceProxy = false}) async {
    LogUtil.d("----------url----------$url");
    LogUtil.d("----------data----------$data");
    final client = forceProxy ? _proxyDio! : _dio!;
    var response = await client.request<String>(url,
        data: data,
        queryParameters: queryParameters,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    if (autoDismiss) {
      dismissProgress();
    }
    return response;
  }

  Future request(Method method, String url,
      {Function(Map<String, dynamic>)? onSuccess,
      Function(String? code, String? mag)? onError,
      dynamic params,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      bool showLoading = false,
      bool autoDismiss = true,
      bool retrying = false}) async {
    String? m = _getRequestMethod(method);
    try {
      if (showLoading) ToastUtils.showLoading();
      var resp = await _request(m, url,
          data: params,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          autoDismiss: autoDismiss,
          forceProxy: retrying);
      if (showLoading) ToastUtils.hideLoading();
      Map<String, dynamic> map =
          await compute(parseData, resp.data.toString());
      if (resp.statusCode != 200) {
        if (resp.statusCode == 401) {

          // AppNavigator.startLogin();
        }
        _onError(map["code"].toString(), map["message"], onError);
      }
      switch (map['code']) {
        case 0:
        case 200:
          if (onSuccess != null) {
            onSuccess(map);
          }
          return map;
        case 401:
          //401 就不执行异常回调了，直接退出，然后去登陆
          _onError(map["code"].toString(), map["message"], null);
          break;
        default:
          LogUtil.d('_map111=====$map');
          _onError(map["code"].toString(), map["message"].toString(), onError);
          break;
      }
      return map;
    } catch (e) {
      LogUtil.e('er-------$e');
      if (e is DioException) {
        LogUtil.d(
          'dio error type=${e.type} status=${e.response?.statusCode} inner=${e.error.runtimeType}',
        );
        if (e.error is HandshakeException) {
          LogUtil.d(
            'handshake while start=${globalState.isStart} runTime=${globalState.appState.runTime} tunEnabled=${globalState.config.patchClashConfig.tun.enable}',
          );
        }
      }
      if (showLoading) ToastUtils.hideLoading();
      Error error = ExceptionHandle.handleException(e);
      if (!retrying && e is DioException) {
        final shouldRetryViaProxy =
            globalState.config.patchClashConfig.tun.enable == true &&
            (e.error is HandshakeException ||
                e.error is HttpException ||
                e.type == DioExceptionType.connectionError ||
                e.type == DioExceptionType.unknown);
        if (shouldRetryViaProxy) {
          LogUtil.d('retry request via proxy after primary failure');
          return await request(
            method,
            url,
            onSuccess: onSuccess,
            onError: onError,
            params: params,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            showLoading: showLoading,
            autoDismiss: autoDismiss,
            retrying: true,
          );
        }
      }
      _onError(error.code.toString(), error.msg, onError);
    }
  }

  Options _checkOptions(method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  _onError(
      String code, String? msg, Function(String? code, String? mag)? onError) {
    // dismissProgress();
    EasyLoading.dismiss();
    if (msg == null || msg.isEmpty) {
      if (onError != null) {
        onError(code, msg);
      }
      LogUtil.d('_onError suppressed toast: code=$code');
      return;
    }
    if (msg == 'Unauthenticated.') {
      // When the server says the session is unauthenticated, avoid
      // terminating the whole process. Instead clear the saved token,
      // notify the user and navigate to the login page so the user can
      // re-authenticate.
      try {
        SpUtil.putString('token', '');
      } catch (_) {}
      ToastUtils.showToast('身份已过期，请重新登录');
      try {
        AppNavigator.startLogin();
      } catch (_) {}
      return;
    }

    if (kDebugMode) {
      debugPrint("接口请求异常： code: $code, msg: $msg");
    }
    if (onError != null) {
      onError(code, msg);
    } else {
      if (msg != null) {
        ToastUtils.showToast(msg);
      }
    }
    LogUtil.e('_onError======$code=====$msg');
    // throw Error(int.parse(code), msg!);
  }

  Map<String, dynamic> parseData(String data) {
    return json.decode(data);
  }


}

String? _getRequestMethod(Method method) {
  String? m;
  switch (method) {
    case Method.get:
      m = "GET";
      break;
    case Method.post:
      m = "POST";
      break;
    case Method.put:
      m = "PUT";
      break;
    case Method.patch:
      m = "PATCH";
      break;
    case Method.delete:
      m = "DELETE";
      break;
    case Method.head:
      m = "HEAD";
      break;
  }
  return m;
}

enum Method { get, post, put, patch, delete, head }
