import 'dart:async';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/app.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/dav_client.dart';
import '../../models/common.dart';
import '../../models/user.dart';
import '../../net/api.dart';
import '../../net/dioutils.dart';
import '../../net/urls.dart';
import '../../state.dart';
import '../../utils/toast_utils.dart';
import '../login.dart';

class DashboardFragment extends ConsumerStatefulWidget {
  const DashboardFragment({super.key});

  @override
  ConsumerState<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends ConsumerState<DashboardFragment>
    with PageMixin {
  final key = GlobalKey<SuperGridState>();

  late User member = ref.watch(memberProvider);

  bool _isLoadingWebDAV = false;

  bool _isConnecting = false;
  String _networkStatus = "去海外";
  bool isStart = false;

  Timer? _autoStopTimer; // 添加定时器变量

  @override
  initState() {
    isStart = globalState.appState.runTime != null;
    ref.listenManual(
      isCurrentPageProvider(PageLabel.dashboard),
          (prev, next) {
        if (prev != next && next == true) {
          initPageState();
        }
      },
      fireImmediately: true,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return; // 避免重复执行
      // 自动登录
      if (member.id == -1) {
        ToastUtils.showLoading(status: '正在尝试自动登录...');
        _getMemberInfo();
        // 延迟 3 秒再关闭提示
        await Future.delayed(const Duration(seconds: 3));
        if (mounted) {
          ToastUtils.hideLoading();
        }
      }

      /// 每次打开去服务器下载配置
      // var temp2 = globalState.config.profiles;
      // if(temp2.isEmpty){
      //   ToastUtils.showLoading(status: '正在加载配置...');
      //   await _autoLoadWebDAV();
      //   ToastUtils.hideLoading();
      // }
    });

    return super.initState();
  }

  _getMemberInfo() async {
    try {
      var data = await DioUtils.instance
          .request(Method.post, Api.getMemberInfo, autoDismiss: false);
      if (data['data'] == null) {
        throw '无法获取用户资料';
      }
      var user = User.fromJson(data['data']);

      ref.read(memberProvider.notifier).updateUser(user);
    } catch (e) {
      // throw Exception('请重新登录');
    }

  }

  _autoLoadWebDAV() async {
    // 检查是否正在执行
    if (_isLoadingWebDAV) {
      // ToastUtils.showToast('正在同步中，请稍候...');
      return;
    }
    if (!mounted) {
      return;
    }

    try {
      _isLoadingWebDAV = true;
      // 显示进度对话框
      // ToastUtils.showLoading(status: '正在获取配置信息...');
      var data = await DioUtils.instance
          .request(Method.post, Api.getDav, autoDismiss: false,params: {'netStatus' :_networkStatus });

      final dav = DAV(
        uri: data['data']['uri'],
        user: data['data']['user'],
        password: data['data']['password'],
        fileName: 'backup.zip',
      );
      // return;
      // ToastUtils.showLoading(status: '正在连接WebDAV...');
      final client = DAVClient(dav);
      // await Future.delayed(Duration(seconds: 1));
      // ToastUtils.showLoading(status: '正在下载备份数据...');
      final tempData = await client.recovery();

      // final tempData = await client.recovery(
      //     onProgress: (count, total) {
      //       if (total > 0) {
      //         final progress = (count / total * 100).toStringAsFixed(1);
      //         ToastUtils.showLoading(status: '正在下载备份数据... $progress%');
      //       }
      //     }
      // );

      // ToastUtils.showLoading(status: '正在恢复数据...');
      await globalState.appController
          .recoveryData(tempData, RecoveryOption.all);

      // ToastUtils.hideLoading();
      // ToastUtils.showSuccess('数据恢复成功');
    } catch (e) {
      ToastUtils.hideLoading();
      ToastUtils.showError('数据恢复失败: $e');
    } finally {
      ToastUtils.hideLoading();
      _isLoadingWebDAV = false; // 重置标志位
    }
  }

  // @override
  // Widget? get floatingActionButton => const StartButton();

  @override
  List<Widget> get actions =>
      [
        if (member.id != -1)
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () async {
              int timestamp = DateTime
                  .now()
                  .millisecondsSinceEpoch ~/ 1000;
              if (member.expired_at! > timestamp) {
                // ToastUtils.showLoading(status: '正在加载配置...');
                await _autoLoadWebDAV();
                ToastUtils.hideLoading();
              } else {
                globalState.appController.clearWebDAV();
              }
            },
          ),
      ];

  handleSwitchStart() async {
    isStart = globalState.appState.runTime != null;

    int timestamp = DateTime
        .now()
        .millisecondsSinceEpoch ~/ 1000;
    var member = ref.watch(memberProvider); // 监听 memberProvider
    /// 如果未登录 则提示尚未登录 ，跳转到登录页
    if (member.id == -1) {
      await showLoginBox(context);
      member = ref.read(memberProvider);
    }
    // var temp2 = globalState.config.profiles;
    //
    // if(temp2.isEmpty){
    //   if(member.id != -1){
    //     if (member.expired_at! > timestamp) {
    //       ToastUtils.showLoading(status: '正在加载配置...');
    //       await _autoLoadWebDAV();
    //       ToastUtils.hideLoading();
    //     } else {
    //       // globalState.appController.clearWebDAV();
    //     }
    //   }
    // }

    /// 每次都去重新获取下用户信息
    await _getMemberInfo();
    if (member.id != -1) {
      if (member.expired_at! < timestamp) {
        ToastUtils.hideLoading(); // 先隐藏之前的loading

        // 显示确认对话框
        final result = await showDialog<bool>(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: const Text('套餐已到期'),
                content: const Text('您的套餐已到期，是否前往购买新套餐？'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('取消'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('确定'),
                  ),
                ],
              ),
        );

        // 如果用户点击确定
        if (result == true) {
          ToastUtils.showLoading(status: '正在跳转...');
          Uri url =  Uri.parse(await request.getShort('$BASE_URL2/#/plan/3'));

          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('无法打开充值页面')),
              );
            }
          }
          ToastUtils.hideLoading();
        }
        return;
      }
    } else {
      return;
    }

    if (isStart == globalState.appState.isStart) {
      /// 如果当前状态是未连接状态，则先去服务器拉取webdav
      if (!isStart) {
        await _autoLoadWebDAV();
        await Future.delayed(const Duration(seconds: 2));
      }
      isStart = !isStart;
      globalState.appController.updateStatus(isStart);

      // 添加定时任务逻辑
      if (isStart) {
        // 如果是开启状态，启动定时器
        _startAutoStopTimer(member.expired_at);
      } else {
        // 如果是关闭状态，取消定时器
        _cancelAutoStopTimer();
      }

    }
  }

  // 添加定时器相关方法
  void _startAutoStopTimer(timestamp) {
    _cancelAutoStopTimer(); // 先取消已存在的定时器

    final now = DateTime.now().millisecondsSinceEpoch;
    final difference = timestamp*1000 - now;

    _autoStopTimer = Timer(Duration(milliseconds: difference), () {
      if ( mounted &&  isStart) {
        setState(() {
          isStart = false;
          globalState.appController.updateStatus(false);
        });
      }
    });
  }

  void _cancelAutoStopTimer() {
    _autoStopTimer?.cancel();
    _autoStopTimer = null;
  }


  @override
  void dispose() {
    _cancelAutoStopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final member = ref.watch(memberProvider);
    if (member.id == -1) {
      isStart = false;
    }

    return Column(
      children: [
        // 网络状态
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(  // 添加 Center 组件
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,  // 让 Row 居中
              children: [
                const Text('模式: ', style: TextStyle(fontSize: 16)),
                if (isStart)
                // VPN 运行时显示纯文本
                  Row(
                    children: [
                      Icon(
                        _networkStatus == "去海外" ? Icons.flight_takeoff : Icons.flight_land_outlined,
                        size: 16,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _networkStatus,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                else
                  ToggleButtons(
                  onPressed: _isConnecting ? null : (int index) {  // 如果 isStart 为 true，禁用点击
                    setState(() {
                      _networkStatus = index == 0 ? "去海外" : "回大陆";
                    });
                  },
                  isSelected: [_networkStatus == "去海外", _networkStatus == "回大陆"],
                  borderRadius: BorderRadius.circular(20),
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  color: Colors.blue,
                  constraints: const BoxConstraints(
                    minWidth: 80,
                    minHeight: 36,
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(Icons.flight_takeoff, size: 16),
                          SizedBox(width: 4),
                          Text('去海外'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(Icons.flight_land_outlined, size: 16),
                          SizedBox(width: 4),
                          Text('回大陆'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // 连接按钮
        Expanded(
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_isConnecting) return;

                  _isConnecting = true;
                  Future.delayed(const Duration(seconds: 0), () async {
                    if (mounted) {
                      await handleSwitchStart();
                      setState(() {
                        _isConnecting = false;
                      });
                    }
                  });
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 光晕动画
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: isStart
                          ? [
                        BoxShadow(
                          color: Colors.greenAccent.withValues(alpha: 0.5),
                          blurRadius: 20,
                          spreadRadius: 20,
                        )
                      ]
                          : [],
                    ),
                  ),

                  // 按钮本体
                  Transform.translate(
                    offset: isStart ? const Offset(0, 0) : Offset.zero,
                    // 轻微上移防止视觉错位
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: isStart
                              ? [Colors.greenAccent, Colors.lightGreen]
                              : [Colors.redAccent, Colors.deepOrange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isStart
                                ? Colors.greenAccent.withValues(alpha: 0.5)
                                : Colors.redAccent.withValues(alpha: 0.5),
                            blurRadius: 15,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: Center(
                        child: _isConnecting
                            ? const CircularProgressIndicator(
                            color: Colors.white)
                            : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isStart ? Icons.link : Icons.link_off,
                              color: Colors.white,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 22, // 固定文本高度，防止内容变动导致抖动
                              child: Text(
                                isStart ? '断开连接' : '开启快连',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // // 错误提示
        // if (!isStart)
        //   Padding(
        //     padding: const EdgeInsets.all(16),
        //     child: TextButton(
        //       onPressed: () {},
        //       child: const SizedBox(width: 8), // 保持结构一致
        //     ),
        //   ),

        // 会员信息 / 登录
        Padding(
          padding: const EdgeInsets.all(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              member.id != -1
                  ? (member.expired_at == 0
                  ? const Text(
                  '尚未购买任何套餐', style: TextStyle(color: Colors.orange))
                  : member.expired_at! < (DateTime
                  .now()
                  .millisecondsSinceEpoch ~/ 1000)
                  ? ElevatedButton(
                onPressed: () async {
                  Uri url =  Uri.parse(await request.getShort('$BASE_URL2/#/plan/3'));
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
                  :  Row(
                children: [
                  Text(
                    "到期时间：${DateFormat('yyyy-MM-dd HH:mm').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            member.expired_at! * 1000))}  ",
                    style: TextStyle(
                        color: member.expired_at! < (DateTime
                            .now()
                            .millisecondsSinceEpoch ~/ 1000) + 86400 * 3
                            ? Colors.orange // 剩余3天内显示橙色
                            : Colors.black87
                    ),
                  ),
                  member.expired_at! > ( DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch ~/ 1000)?
                  SizedBox(width: 10,):
                  ElevatedButton(
                    onPressed: () async {
                      Uri url =  Uri.parse(await request.getShort('$BASE_URL2/#/plan/3'));
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
                        Text('充值'),
                      ],
                    ),
                  )
                ],
              )

              )
                  : ElevatedButton.icon(
                onPressed: () => showLoginBox(context),
                icon: const Icon(Icons.person),
                label: const Text('登录'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  showLoginBox(context) {
    return showDialog(
      context: context,
      builder: (context) =>
          Dialog(
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
}
