import 'dart:ui';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/fragments/profiles/edit_profile.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_profile.dart';
import 'gen_profile.dart';

class ProfilesFragment extends StatefulWidget {
  const ProfilesFragment({super.key});

  @override
  State<ProfilesFragment> createState() => _ProfilesFragmentState();
}

class _ProfilesFragmentState extends State<ProfilesFragment> with PageMixin {
  Function? applyConfigDebounce;

  _handleShowAddExtendPage() {
    showExtendPage(
      globalState.navigatorKey.currentState!.context,
      body: AddProfile(
        context: globalState.navigatorKey.currentState!.context,
      ),
      title: "${appLocalizations.add}${appLocalizations.profile}",
    );
  }

  _updateProfiles() async {
    final profiles = globalState.config.profiles;
    final messages = <String>[];
    final successMessages = <String>[];
    final updateProfiles = profiles.map<Future>(
      (profile) async {
        if (profile.type == ProfileType.file) return;
        globalState.appController.setProfile(
          profile.copyWith(isUpdating: true),
        );
        try {
          await globalState.appController.updateProfile(profile);
          // 更新成功
          successMessages.add("${profile.label ?? profile.id}: 更新成功\n");
        } catch (e) {
          // 分类错误信息，提供更友好的提示
          String errorMessage = _formatErrorMessage(e.toString());
          messages.add("${profile.label ?? profile.id}: $errorMessage\n");
          globalState.appController.setProfile(
            profile.copyWith(
              isUpdating: false,
            ),
          );
        }
      },
    );
    final titleMedium = context.textTheme.titleMedium;
    final successStyle = titleMedium?.copyWith(color: Colors.green);
    final errorStyle = titleMedium?.copyWith(color: Colors.red);
    
    await Future.wait(updateProfiles);
    
    // 显示更新结果
    List<TextSpan> resultSpans = [];
    if (successMessages.isNotEmpty) {
      resultSpans.addAll([
        for (final message in successMessages)
          TextSpan(text: message, style: successStyle)
      ]);
    }
    if (messages.isNotEmpty) {
      resultSpans.addAll([
        for (final message in messages)
          TextSpan(text: message, style: errorStyle)
      ]);
    }
    
    if (resultSpans.isNotEmpty) {
      globalState.showMessage(
        title: messages.isEmpty ? "更新完成" : "更新结果", 
        message: TextSpan(children: resultSpans),
      );
    }
  }

  /// 格式化错误信息，提供更友好的提示
  String _formatErrorMessage(String error) {
    if (error.contains('配置格式验证失败')) {
      return '订阅源配置格式有误，原配置已保持不变';
    } else if (error.contains('节点可用性验证失败')) {
      return '订阅源中没有可用节点，原配置已保持不变';
    } else if (error.contains('配置中未找到任何有效的代理节点')) {
      return '新配置中没有有效代理节点，原配置已保持不变';
    } else if (error.contains('网络') || error.contains('连接') || error.contains('timeout')) {
      return '网络连接失败，原配置保持不变，请检查订阅链接';
    } else if (error.contains('临时文件')) {
      return '配置保存过程中出错，原配置保持不变';
    } else {
      return '更新失败，原配置保持不变: ${error.length > 40 ? error.substring(0, 40) + '...' : error}';
    }
  }

  @override
  List<Widget> get actions => [
        IconButton(
          onPressed: () {
            _updateProfiles();
          },
          icon: const Icon(Icons.sync),
        ),
        IconButton(
          onPressed: () {
            final profiles = globalState.config.profiles;
            showSheet(
              title: appLocalizations.profilesSort,
              context: context,
              body: SizedBox(
                height: 400,
                child: ReorderableProfiles(profiles: profiles),
              ),
            );
          },
          icon: const Icon(Icons.sort),
          iconSize: 26,
        ),
      ];

  @override
  Widget? get floatingActionButton => FloatingActionButton(
        heroTag: null,
        onPressed: _handleShowAddExtendPage,
        child: const Icon(
          Icons.add,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        ref.listenManual(
          isCurrentPageProvider(PageLabel.profiles),
          (prev, next) {
            if (prev != next && next == true) {
              initPageState();
            }
          },
          fireImmediately: true,
        );
        final profilesSelectorState = ref.watch(profilesSelectorStateProvider);
        if (profilesSelectorState.profiles.isEmpty) {
          return NullStatus(
            label: appLocalizations.nullProfileDesc,
          );
        }
        return Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 88,
            ),
            child: Grid(
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: profilesSelectorState.columns,
              children: [
                for (int i = 0; i < profilesSelectorState.profiles.length; i++)
                  GridItem(
                    child: ProfileItem(
                      key: Key(profilesSelectorState.profiles[i].id),
                      profile: profilesSelectorState.profiles[i],
                      groupValue: profilesSelectorState.currentProfileId,
                      onChanged: (profileId) {
                        ref.read(currentProfileIdProvider.notifier).value =
                            profileId;
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileItem extends StatelessWidget {
  final Profile profile;
  final String? groupValue;
  final void Function(String? value) onChanged;

  const ProfileItem({
    super.key,
    required this.profile,
    required this.groupValue,
    required this.onChanged,
  });

  _handleDeleteProfile(BuildContext context) async {
    final res = await globalState.showMessage(
      title: appLocalizations.tip,
      message: TextSpan(
        text: appLocalizations.deleteProfileTip,
      ),
    );
    if (res != true) {
      return;
    }
    await globalState.appController.deleteProfile(profile.id);
  }

  Future updateProfile() async {
    final appController = globalState.appController;
    if (profile.type == ProfileType.file) return;
    await globalState.safeRun(silence: false, () async {
      try {
        appController.setProfile(
          profile.copyWith(
            isUpdating: true,
          ),
        );
        await appController.updateProfile(profile);
        
        // 更新成功，显示成功提示
        globalState.showMessage(
          title: "更新成功",
          message: TextSpan(
            text: "${profile.label ?? profile.id} 订阅更新成功",
            style: TextStyle(color: Colors.green),
          ),
        );
      } catch (e) {
        appController.setProfile(
          profile.copyWith(
            isUpdating: false,
          ),
        );
        
        // 显示详细的错误信息
        String errorMessage = _formatSingleUpdateError(e.toString());
        globalState.showMessage(
          title: "更新失败", 
          message: TextSpan(
            text: "${profile.label ?? profile.id}: $errorMessage",
            style: TextStyle(color: Colors.red),
          ),
        );
        rethrow;
      }
    });
  }

  /// 格式化单个更新的错误信息
  String _formatSingleUpdateError(String error) {
    if (error.contains('配置格式验证失败')) {
      return '订阅源配置格式有误，原配置保持不变，代理服务未受影响';
    } else if (error.contains('节点可用性验证失败')) {
      return '订阅源中没有找到可用的代理节点，原配置保持不变';
    } else if (error.contains('配置中未找到任何有效的代理节点')) {
      return '新的订阅配置中没有有效的代理节点，原配置保持不变';
    } else if (error.contains('网络') || error.contains('连接') || error.contains('timeout')) {
      return '网络连接失败，原配置保持不变，当前代理服务正常';
    } else if (error.contains('临时文件')) {
      return '配置保存过程出错，原配置保持不变，代理服务未受影响';
    } else {
      return '更新失败，原配置保持不变: ${error.length > 60 ? error.substring(0, 60) + '...' : error}';
    }
  }

  _handleShowEditExtendPage(BuildContext context) {
    showExtendPage(
      context,
      body: EditProfile(
        profile: profile,
        context: context,
      ),
      title: "${appLocalizations.edit}${appLocalizations.profile}",
    );
  }

  List<Widget> _buildUrlProfileInfo(BuildContext context) {
    final subscriptionInfo = profile.subscriptionInfo;
    return [
      const SizedBox(
        height: 8,
      ),
      if (subscriptionInfo != null)
        SubscriptionInfoView(
          subscriptionInfo: subscriptionInfo,
        ),
      Text(
        profile.lastUpdateDate?.lastUpdateTimeDesc ?? "",
        style: context.textTheme.labelMedium?.toLight,
      ),
    ];
  }

  List<Widget> _buildFileProfileInfo(BuildContext context) {
    return [
      const SizedBox(
        height: 8,
      ),
      Text(
        profile.lastUpdateDate?.lastUpdateTimeDesc ?? "",
        style: context.textTheme.labelMedium?.toLight,
      ),
    ];
  }

  // _handleCopyLink(BuildContext context) async {
  //   await Clipboard.setData(
  //     ClipboardData(
  //       text: profile.url,
  //     ),
  //   );
  //   if (context.mounted) {
  //     context.showNotifier(appLocalizations.copySuccess);
  //   }
  // }

  _handleExportFile(BuildContext context) async {
    final commonScaffoldState = context.commonScaffoldState;
    final res = await commonScaffoldState?.loadingRun<bool>(
      () async {
        final file = await profile.getFile();
        final value = await picker.saveFile(
          profile.label ?? profile.id,
          file.readAsBytesSync(),
        );
        if (value == null) return false;
        return true;
      },
      title: appLocalizations.tip,
    );
    if (res == true && context.mounted) {
      context.showNotifier(appLocalizations.exportSuccess);
    }
  }

  _handlePushGenProfilePage(BuildContext context, String id) {
    BaseNavigator.push(
      context,
      GenProfile(
        profileId: id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<CommonPopupBoxState>();
    return CommonCard(
      isSelected: profile.id == groupValue,
      onPressed: () {
        onChanged(profile.id);
      },
      child: ListItem(
        key: Key(profile.id),
        horizontalTitleGap: 16,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        trailing: SizedBox(
          height: 40,
          width: 40,
          child: FadeBox(
            child: profile.isUpdating
                ? const Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator(),
                  )
                : CommonPopupBox(
                    key: key,
                    popup: CommonPopupMenu(
                      items: [
                        ActionItemData(
                          icon: Icons.edit_outlined,
                          label: appLocalizations.edit,
                          onPressed: () {
                            _handleShowEditExtendPage(context);
                          },
                        ),
                        if (profile.type == ProfileType.url) ...[
                          ActionItemData(
                            icon: Icons.sync_alt_sharp,
                            label: appLocalizations.sync,
                            onPressed: () {
                              updateProfile();
                            },
                          ),
                          // ActionItemData(
                          //   icon: Icons.copy,
                          //   label: appLocalizations.copyLink,
                          //   onPressed: () {
                          //     _handleCopyLink(context);
                          //   },
                          // ),
                        ],
                        // ActionItemData(
                        //   icon: Icons.extension_outlined,
                        //   label: "自定义",
                        //   onPressed: () {
                        //     _handlePushGenProfilePage(context, profile.id);
                        //   },
                        // ),
                        ActionItemData(
                          icon: Icons.file_copy_outlined,
                          label: appLocalizations.exportFile,
                          onPressed: () {
                            _handleExportFile(context);
                          },
                        ),
                        ActionItemData(
                          icon: Icons.delete_outlined,
                          iconSize: 20,
                          label: appLocalizations.delete,
                          onPressed: () {
                            _handleDeleteProfile(context);
                          },
                          type: ActionType.danger,
                        ),
                      ],
                    ),
                    target: IconButton(
                      onPressed: () {
                        key.currentState?.pop();
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                profile.label ?? profile.id,
                style: context.textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...switch (profile.type) {
                    ProfileType.file => _buildFileProfileInfo(context),
                    ProfileType.url => _buildUrlProfileInfo(context),
                  },
                ],
              ),
            ],
          ),
        ),
        tileTitleAlignment: ListTileTitleAlignment.titleHeight,
      ),
    );
  }
}

class ReorderableProfiles extends StatefulWidget {
  final List<Profile> profiles;

  const ReorderableProfiles({
    super.key,
    required this.profiles,
  });

  @override
  State<ReorderableProfiles> createState() => _ReorderableProfilesState();
}

class _ReorderableProfilesState extends State<ReorderableProfiles> {
  late List<Profile> profiles;

  @override
  void initState() {
    super.initState();
    profiles = List.from(widget.profiles);
  }

  Widget proxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    final profile = profiles[index];
    return AnimatedBuilder(
      animation: animation,
      builder: (_, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double scale = lerpDouble(1, 1.02, animValue)!;
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        key: Key(profile.id),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: CommonCard(
          type: CommonCardType.filled,
          child: ListTile(
            contentPadding: const EdgeInsets.only(
              right: 44,
              left: 16,
            ),
            title: Text(profile.label ?? profile.id),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: ReorderableListView.builder(
            buildDefaultDragHandles: false,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            proxyDecorator: proxyDecorator,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final profile = profiles.removeAt(oldIndex);
                profiles.insert(newIndex, profile);
              });
            },
            itemBuilder: (_, index) {
              final profile = profiles[index];
              return Container(
                key: Key(profile.id),
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CommonCard(
                  type: CommonCardType.filled,
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                    ),
                    title: Text(profile.label ?? profile.id),
                    trailing: ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.drag_handle),
                    ),
                  ),
                ),
              );
            },
            itemCount: profiles.length,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: FilledButton.tonal(
            onPressed: () {
              Navigator.of(context).pop();
              globalState.appController.setProfiles(profiles);
            },
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLocalizations.confirm,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
