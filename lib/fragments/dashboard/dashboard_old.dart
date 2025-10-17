// import 'dart:math';
//
// import 'package:zhuquejiasu/common/common.dart';
// import 'package:zhuquejiasu/enum/enum.dart';
// import 'package:zhuquejiasu/providers/providers.dart';
// import 'package:zhuquejiasu/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../common/dav_client.dart';
// import '../../models/common.dart';
// import '../../models/user.dart';
// import '../../net/api.dart';
// import '../../net/dioutils.dart';
// import '../../state.dart';
// import '../../utils/toast_utils.dart';
// import 'widgets/start_button.dart';
//
// class DashboardFragment extends ConsumerStatefulWidget {
//   const DashboardFragment({super.key});
//
//   @override
//   ConsumerState<DashboardFragment> createState() => _DashboardFragmentState();
// }
//
// class _DashboardFragmentState extends ConsumerState<DashboardFragment>
//     with PageMixin {
//   final key = GlobalKey<SuperGridState>();
//
//   late User member = ref.watch(memberProvider);
//
//   @override
//   initState() {
//     ref.listenManual(
//       isCurrentPageProvider(PageLabel.dashboard),
//           (prev, next) {
//         if (prev != next && next == true) {
//           initPageState();
//         }
//       },
//       fireImmediately: true,
//     );
//
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       if (!mounted) return; // 避免重复执行
//       // 自动登录
//       if (member.id == -1) {
//         _getMemberInfo();
//       }
//
//     });
//
//     return super.initState();
//   }
//
//   _getMemberInfo() async {
//     try {
//       var data = await DioUtils.instance
//           .request(Method.get, Api.getMemberInfo, autoDismiss: false);
//       if (data['data'] == null) {
//         throw '无法获取用户资料';
//       }
//       var user = User.fromJson(data['data']);
//
//       ref.read(memberProvider.notifier).updateUser(user);
//     } catch (e) {
//       // throw Exception('请重新登录');
//     }
//   }
//
//   _autoLoadWebDAV() async {
//     //获取dav信息
//     var data = await DioUtils.instance
//         .request(Method.get, Api.getDav, autoDismiss: false);
//
//     final dav = DAV(
//         uri: data['data']['uri'],
//         user: data['data']['user'],
//         password: data['data']['password']);
//     final client = DAVClient(dav);
//     await Future.delayed(Duration(seconds: 5), () async {
//       final data = await client.recovery();
//       await globalState.appController.recoveryData(data, RecoveryOption.all);
//     });
//   }
//
//   @override
//   Widget? get floatingActionButton => const StartButton();
//
//   @override
//   List<Widget> get actions => [
//
//
//     if(member.id != -1)
//       IconButton(
//         icon: Icon(
//           Icons.refresh,
//         ),
//         onPressed: () async {
//           int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//           if (member.expiredAt! > timestamp) {
//             ToastUtils.showLoading(status: '正在加载配置...');
//             await _autoLoadWebDAV();
//             ToastUtils.hideLoading();
//           } else {
//             globalState.appController.clearWebDAV();
//           }
//         },
//       ),
//
//     ValueListenableBuilder(
//       valueListenable: key.currentState!.addedChildrenNotifier,
//       builder: (_, addedChildren, child) {
//         return ValueListenableBuilder(
//           valueListenable: key.currentState!.isEditNotifier,
//           builder: (_, isEdit, child) {
//             if (!isEdit || addedChildren.isEmpty) {
//               return Container();
//             }
//             return child!;
//           },
//           child: child,
//         );
//       },
//       child: IconButton(
//         onPressed: () {
//           key.currentState!.showAddModal();
//         },
//         icon: Icon(
//           Icons.add_circle,
//         ),
//       ),
//     ),
//
//     IconButton(
//       icon: ValueListenableBuilder(
//         valueListenable: key.currentState!.isEditNotifier,
//         builder: (_, isEdit, ___) {
//           return isEdit
//               ? Icon(Icons.save)
//               : Icon(
//             Icons.edit,
//           );
//         },
//       ),
//       onPressed: () {
//         key.currentState!.isEditNotifier.value =
//         !key.currentState!.isEditNotifier.value;
//       },
//     ),
//   ];
//
//   _handleSave(List<GridItem> girdItems, WidgetRef ref) {
//     final dashboardWidgets = girdItems
//         .map(
//           (item) => DashboardWidget.getDashboardWidget(item),
//     )
//         .toList();
//     ref.read(appSettingProvider.notifier).updateState(
//           (state) => state.copyWith(dashboardWidgets: dashboardWidgets),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final dashboardState = ref.watch(dashboardStateProvider);
//     final columns = max(4 * ((dashboardState.viewWidth / 350).ceil()), 8);
//     return Align(
//       alignment: Alignment.topCenter,
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(16).copyWith(
//           bottom: 88,
//         ),
//         child: SuperGrid(
//           key: key,
//           crossAxisCount: columns,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           children: [
//             ...dashboardState.dashboardWidgets
//                 .where(
//                   (item) => item.platforms.contains(
//                 SupportPlatform.currentPlatform,
//               ),
//             )
//                 .map(
//                   (item) => item.widget,
//             ),
//           ],
//           onSave: (girdItems) {
//             _handleSave(girdItems, ref);
//           },
//           addedItemsBuilder: (girdItems) {
//             return DashboardWidget.values
//                 .where(
//                   (item) =>
//               !girdItems.contains(item.widget) &&
//                   item.platforms.contains(
//                     SupportPlatform.currentPlatform,
//                   ),
//             )
//                 .map((item) => item.widget)
//                 .toList();
//           },
//         ),
//       ),
//     );
//   }
// }
