import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sp_util/sp_util.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/request.dart';
import '../../../net/urls.dart';
import '../../../providers/app.dart';
import '../../../state.dart';
import '../../../utils/toast_utils.dart';
import '../../login.dart';
import 'dart:core';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
  });

  showLoginBox(context){
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const LoginFragment(),
            // 关闭按钮
            Positioned(
              right: -10,
              top: -10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _logout(WidgetRef ref) async {
    // 触发退出登录逻辑
    ref.read(memberProvider.notifier).logout(); // 调用 provider 处理退出

    if(globalState.appState.runTime != null){
      globalState.appController.updateStatus(false);
    }

    /// 清理webdav信息
    globalState.appController.clearWebDAV();
    // 清理缓存
    await SpUtil.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {  // 添加 WidgetRef 参数
    final member = ref.watch(memberProvider); // 现在可以使用 ref 了

    return Drawer(
      child: Column(
        children: [
          // 用户信息区域
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            currentAccountPictureSize: Size.square(60),
            accountName: Text(
              member.id == -1 ? "":member.email.toString(),  // 使用用户信息
              style: const TextStyle(color: Colors.black),
            ),
            accountEmail: Row(
              children: [
                Text(
                   "分享链接赚取佣金 ",
                  style: const TextStyle(color: Colors.black54),
                ),
                // Spacer(), // 添加这一行，将按钮推到右侧
                TextButton.icon(
                  onPressed: () async {
                    if (member.inviteCode != null && member.inviteCode!.isNotEmpty) {
                      ToastUtils.showLoading();
                      var inv = member.inviteCode.toString();
                      String url =  await request.getShort('$secondaryBaseUrl/static/index.html?invitationCode=$inv');
                      await Clipboard.setData(ClipboardData(text: url));
                      ToastUtils.showToast('邀请码已复制到剪贴板');
                      ToastUtils.hideLoading();
                    }
                  },
                  icon: Icon(Icons.copy, size: 16),
                  label: Text('点击复制'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.blue.shade200),
                    ),
                  ),
                ),
              ],
            ),
            otherAccountsPictures: [
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 20),
                onPressed: () {
                  if (member.id == -1) {
                    // 未登录状态，显示登录窗口
                    showLoginBox(context);
                  } else {
                    // 已登录状态，显示退出确认对话框
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('退出登录'),
                        content: const Text('确定要退出登录吗？'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('取消'),
                          ),
                          TextButton(
                            onPressed: () {
                              _logout(ref);
                              Navigator.pop(context);
                            },
                            child: const Text('确定'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),

          // 到期时间
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Text("到期时间:   ", style: TextStyle(color: Colors.black54)),
                if (member.expiredAt == 0)
                  const Text('尚未购买任何套餐')
                else if (member.expiredAt! < (DateTime.now().millisecondsSinceEpoch ~/ 1000))
                  ElevatedButton(
                    onPressed: () async {
                      Uri url =  Uri.parse(await request.getShort('$secondaryBaseUrl/#/plan/3'));
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shopping_cart, size: 18),
                        SizedBox(width: 4),
                        Text('已过期，去充值'),
                      ],
                    ),
                  )
                else
                  Text(DateTime.fromMillisecondsSinceEpoch(member.expiredAt! * 1000).toString()),
              ],
            ),
          ),

          const Divider(),

          // 菜单项列表
          // ListTile(
          //   leading: const Icon(Icons.language),
          //   title: const Text("变更国家与地区"),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.card_giftcard, color: Colors.orange),
          //   title: const Text("推荐有奖"),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.card_membership, color: Colors.pink),
          //   title: const Text("免费领会员"),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.whatshot, color: Colors.red),
          //   title: const Text("大家都在玩"),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.notifications, color: Colors.purple),
          //   title: Row(
          //     children: const [
          //       Text("消息中心"),
          //       SizedBox(width: 8),
          //       CircleAvatar(
          //         backgroundColor: Colors.red,
          //         radius: 8,
          //         child: Text("2", style: TextStyle(color: Colors.white, fontSize: 10)),
          //       ),
          //     ],
          //   ),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.home_sharp, color: Colors.blue),
          //   title: const Text("后台"),
          //   onTap: () async {
          //     final Uri url = Uri.parse("https://v2board.zhuquejiasu.uk/");
          //     if (await canLaunchUrl(url)) {
          //       await launchUrl(url);
          //     } else {
          //       // 处理无法打开链接的情况
          //       print('无法打开链接: $url');
          //     }
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.headset_mic, color: Colors.deepPurple),
            title: const Text("在线客服"),
            onTap: () async {
              final Uri url = Uri.parse("https://t.me/zhuquejiasu_customer_service_bot");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                // 处理无法打开链接的情况
                debugPrint('无法打开链接: $url');
              }
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.telegram_sharp, color: Colors.deepPurple),
          //   title: const Text("飞机群组"),
          //   onTap: () async {
          //     final Uri url = Uri.parse("https://t.me/+lUYgN3grexA0MTE9");
          //     if (await canLaunchUrl(url)) {
          //       await launchUrl(url);
          //     } else {
          //       // 处理无法打开链接的情况
          //       print('无法打开链接: $url');
          //     }
          //   },
          // ),

          // ListTile(
          //   leading: const Icon(Icons.upload_file, color: Colors.lightBlue),
          //   title: const Text("上传日志"),
          //   onTap: () {},
          // ),

          const Spacer(),

          // 底部版本信息
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "当前版本: ${globalState.packageInfo.version}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // 底部续费按钮
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: ElevatedButton(
          //       onPressed: () {},
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.blue,
          //         padding: const EdgeInsets.symmetric(vertical: 12),
          //       ),
          //       child: const Text("续费会员"),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
