import 'dart:io';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class ExceptionHandle {
  static const int success = 200;
  static const int successNoContent = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;

  static const int netError = 1000;
  static const int parseError = 1001;
  static const int socketError = 1002;
  static const int httpError = 1003;
  static const int timeoutError = 1004;
  static const int cancelError = 1005;
  static const int unknownError = 9999;

  static Error handleException(dynamic error){
    developer.log('Request error: $error', name: 'ExceptionHandle');
    if (error is DioException){
      if (error.type == DioExceptionType.unknown ||
          error.type == DioExceptionType.badResponse){
        dynamic e = error.error;
        if (e is SocketException){
          return Error(socketError, "网络异常，请检查你的网络！");
        }
        if (e is HttpException){
          return Error(httpError, "服务器异常！");
        }
        return Error(netError, "网络异常，请检查你的网络！");
      }else if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout){
        return Error(timeoutError, "连接超时！");
      }else if (error.type == DioExceptionType.cancel){
        return Error(cancelError, "取消请求");
      }else{
        return Error(unknownError, "未知异常");
      }
    }else if(int.tryParse(error.code.toString())!=null){
      //todo 这个判断请优化
      return Error(error.code, "请求地址错误");
    }else {
      return Error(unknownError, "未知异常");
    }
  }
}

class Error{
  int code;
  String msg;

  Error(this.code, this.msg);
}
