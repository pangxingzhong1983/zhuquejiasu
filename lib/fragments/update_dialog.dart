import 'dart:io';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:zhuquejiasu/common/common.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateDialog extends StatefulWidget {
  final Map<String, dynamic> data;

  const UpdateDialog({super.key, required this.data});

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  double _progress = 0;

  bool _isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // 如果是强制更新，禁止返回键关闭
      canPop: widget.data['forceUpdate'] != true,
      child: AlertDialog(
        title: const Text('发现新版本'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.data['description']),
            if (_progress > 0) ...[
              const SizedBox(height: 10),
              LinearProgressIndicator(value: _progress),
              Text('${(_progress * 100).toStringAsFixed(1)}%'),
            ],
          ],
        ),
        actions: [
          // 非强制更新时显示取消按钮
          if (!_isDownloading && widget.data['forceUpdate'] != true)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('暂不更新'),
            ),
          if (!_isDownloading)
            TextButton(
              onPressed: () async {
                setState(() {
                  _isDownloading = true;
                });

                try {
                  bool success = await downloadAndInstallUpdate(
                    widget.data['downloadUrl'],
                        (progress) {
                      if (mounted) {
                        setState(() => _progress = progress);
                      }
                    },
                  );

                  if (success && mounted) {
                    // 下载成功，显示重启提示
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          AlertDialog(
                            title: const Text('更新成功'),
                            content: const Text('请重启应用以完成更新'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await system.terminate(); // 退出应用 (debug suppressed on Android)
                                },
                                child: const Text('立即重启'),
                              ),
                            ],
                          ),
                    );
                  } else if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('下载失败，请稍后重试')),
                    );
                    setState(() {
                      _isDownloading = false;
                    });
                  }
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('更新失败，请稍后重试')),
                    );
                    setState(() {
                      _isDownloading = false;
                    });
                  }
                }
              },
              child: const Text('立即更新'),
            ),
        ],
      ),
    );

  }


  Future<bool> downloadAndInstallUpdate(String downloadUrl,
      Function(double) onProgress) async {
    try {
      if (Platform.isAndroid) {
        // Android 下载并安装 APK
        var dir = await getExternalStorageDirectory();
        var savePath = '${dir?.path}/update.apk';
        debugPrint('APK 保存路径: ${dir?.path}/update.apk');

        // 如果文件已存在，先删除
        final file = File(savePath);
        if (await file.exists()) {
          await file.delete();
        }

        final dio = Dio(BaseOptions(
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(minutes: 5),
            sendTimeout: const Duration(seconds: 30),
            headers: {
              'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
            }
        ));

        await dio.download(
          downloadUrl,
          savePath,
          onReceiveProgress: (int received, int total) {
            if (total != -1) {
              double progress = received / total.toDouble();
              onProgress(progress);
            }
          },
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: true,
            headers: {
              'Accept-Encoding': 'gzip, deflate',
              'Connection': 'keep-alive',
            },
            persistentConnection: true,
          ),
        );

        // 安装 APK
        if (await File(savePath).exists()) {
          await installApk(savePath);
          return true;
        }
        return false;
      } else if (Platform.isWindows) {
        // Windows 直接跳转到下载页面
        final Uri url = Uri.parse(downloadUrl);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
          return true;
        }
        return false;
      }
      return false;
    } catch (e) {
      debugPrint('更新失败: $e');
      return false;
    }
  }


  static const platform = MethodChannel('com.example.app/install');

  Future<bool> installApk(String filePath) async {
    try {
      // 检查文件是否存在
      if (!await File(filePath).exists()) {
        throw Exception('APK文件不存在');
      }

      // 调用原生方法安装
      final bool result = await platform.invokeMethod('installApk', {
        'filePath': filePath
      });
      return result;
    } catch (e) {
      debugPrint('安装失败: $e');
      return false;
    }
  }
}
