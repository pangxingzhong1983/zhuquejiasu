import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:webdav_client/webdav_client.dart';

class DAVClient {
  late Client client;
  Completer<bool> pingCompleter = Completer();
  late String fileName;


  DAVClient(DAV dav) {
    client = newClient(
      dav.uri,
      user: dav.user,
      password: dav.password,
    );
    fileName = dav.fileName;
    client.setHeaders(
      {
        'accept-charset': 'utf-8',
        'Content-Type': 'text/xml',
      },
    );
    client.setConnectTimeout(8000);
    client.setSendTimeout(60000);
    client.setReceiveTimeout(60000);
    pingCompleter.complete(_ping());
  }

  Future<bool> _ping() async {
    try {
      // await client.ping();
      return true;
    } catch (_) {
      return false;
    }
  }

  get root => "/ZhuqueJiasu";

  get backupFile => "$root/$fileName";

  backup(Uint8List data) async {
    await client.mkdir("$root");
    await client.write("$backupFile", data);
    return true;
  }

  Future<List<int>> recovery() async {
    try {
      return await client.read(backupFile);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        return const <int>[];
      }
      rethrow;
    }
  }

  // Future<List<int>> recovery({Function(int received, int total)? onProgress}) async {
  //   await client.mkdir("$root");
  //
  //   // 先获取文件信息
  //   final props = await client.readProps(backupFile);
  //   final fileSize = props.size ?? 0;
  //
  //   // 使用带进度的下载
  //   final data = await client.read(
  //     backupFile,
  //     onProgress: (count, total) {
  //       onProgress?.call(count, fileSize);
  //     },
  //   );
  //
  //   return data;
  // }
}
