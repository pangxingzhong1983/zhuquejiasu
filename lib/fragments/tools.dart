import 'dart:io';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/fragments/about.dart';
import 'package:fl_clash/fragments/access.dart';
import 'package:fl_clash/fragments/application_setting.dart';
import 'package:fl_clash/fragments/config/config.dart';
import 'package:fl_clash/fragments/hotkey.dart';
import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';
import '../models/user.dart';
import '../net/api.dart';
import '../net/dioutils.dart';
import 'backup_and_recovery.dart';
import 'login.dart';
import 'theme.dart';
import 'package:path/path.dart' show dirname, join;

class ToolsFragment extends ConsumerStatefulWidget {
  const ToolsFragment({super.key});

  @override
  ConsumerState<ToolsFragment> createState() => _ToolboxFragmentState();
}

class _ToolboxFragmentState extends ConsumerState<ToolsFragment> {
  _buildNavigationMenuItem(NavigationItem navigationItem) {
    return ListItem.open(
      leading: navigationItem.icon,
      title: Text(Intl.message(navigationItem.label.name)),
      subtitle: navigationItem.description != null
          ? Text(Intl.message(navigationItem.description!))
          : null,
      delegate: OpenDelegate(
        title: Intl.message(navigationItem.label.name),
        widget: navigationItem.fragment,
        extendPageWidth: 360,
      ),
    );
  }

  Widget _buildNavigationMenu(List<NavigationItem> navigationItems) {
    return Column(
      children: [
        for (final navigationItem in navigationItems) ...[
          _buildNavigationMenuItem(navigationItem),
          navigationItems.last != navigationItem
              ? const Divider(
                  height: 0,
                )
              : Container(),
        ]
      ],
    );
  }

  List<Widget> _getOtherList() {
    return generateSection(
      title: appLocalizations.other,
      items: [
        // _DisclaimerItem(),
        // _InfoItem(),
      ],
    );
  }

  List<Widget> _getSettingList() {
    return generateSection(
      title: appLocalizations.settings,
      items: [
        _LoginItem(),
        _LocaleItem(),
        _ThemeItem(),
        // _BackupItem(),
        if (system.isDesktop) _HotkeyItem(),
        if (Platform.isWindows) _LoopbackItem(),
        if (Platform.isAndroid) _AccessItem(),
        // _OverrideItem(),
        _SettingItem(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(appSettingProvider.select((state) => state.locale));
    final items = [
      Consumer(
        builder: (_, ref, __) {
          final state = ref.watch(moreToolsSelectorStateProvider);
          if (state.navigationItems.isEmpty) {
            return Container();
          }
          return Column(
            children: [
              ListHeader(title: appLocalizations.more),
              _buildNavigationMenu(state.navigationItems)
            ],
          );
        },
      ),
      ..._getSettingList(),
      ..._getOtherList(),
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) => items[index],
      padding: const EdgeInsets.only(bottom: 20),
    );
  }
}

class _LocaleItem extends ConsumerWidget {
  const _LocaleItem();

  String _getLocaleString(Locale? locale) {
    if (locale == null) return appLocalizations.defaultText;
    return Intl.message(locale.toString());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale =
        ref.watch(appSettingProvider.select((state) => state.locale));
    final subTitle = locale ?? appLocalizations.defaultText;
    final currentLocale = other.getLocaleForString(locale);
    return ListItem<Locale?>.options(
      leading: const Icon(Icons.language_outlined),
      title: Text(appLocalizations.language),
      subtitle: Text(Intl.message(subTitle)),
      delegate: OptionsDelegate(
        title: appLocalizations.language,
        options: [null, ...AppLocalizations.delegate.supportedLocales],
        onChanged: (Locale? locale) {
          ref.read(appSettingProvider.notifier).updateState(
                (state) => state.copyWith(locale: locale?.toString()),
              );
        },
        textBuilder: (locale) => _getLocaleString(locale),
        value: currentLocale,
      ),
    );
  }
}

class _ThemeItem extends StatelessWidget {
  const _ThemeItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const Icon(Icons.style),
      title: Text(appLocalizations.theme),
      subtitle: Text(appLocalizations.themeDesc),
      delegate: OpenDelegate(
        title: appLocalizations.theme,
        widget: const ThemeFragment(),
        extendPageWidth: 360,
      ),
    );
  }
}

class _BackupItem extends StatelessWidget {
  const _BackupItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const Icon(Icons.cloud_sync),
      title: Text(appLocalizations.backupAndRecovery),
      subtitle: Text(appLocalizations.backupAndRecoveryDesc),
      delegate: OpenDelegate(
        title: appLocalizations.backupAndRecovery,
        widget: const BackupAndRecovery(),
      ),
    );
  }
}

class _HotkeyItem extends StatelessWidget {
  const _HotkeyItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const Icon(Icons.keyboard),
      title: Text(appLocalizations.hotkeyManagement),
      subtitle: Text(appLocalizations.hotkeyManagementDesc),
      delegate: OpenDelegate(
        title: appLocalizations.hotkeyManagement,
        widget: const HotKeyFragment(),
      ),
    );
  }
}

class _LoopbackItem extends StatelessWidget {
  const _LoopbackItem();

  @override
  Widget build(BuildContext context) {
    return ListItem(
      leading: const Icon(Icons.lock),
      title: Text(appLocalizations.loopback),
      subtitle: Text(appLocalizations.loopbackDesc),
      onTap: () {
        windows?.runas(
          '"${join(dirname(Platform.resolvedExecutable), "EnableLoopback.exe")}"',
          "",
        );
      },
    );
  }
}

class _LoginItem extends ConsumerWidget {
  const _LoginItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(memberProvider); // 监听用户状态

    return Column(
      children: [
        member.id == -1
            ? ListItem.open(
          leading: const Icon(Icons.login),
          title: const Text("登录/注册"),
          delegate: OpenDelegate(
            title: "登录/注册",
            widget: const LoginFragment(),
            extendPageWidth: 360,
          ),
        )
            : ListItem(
          leading: const Icon(Icons.person),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(member.email!, overflow: TextOverflow.ellipsis)),
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.blue),
                onPressed: () => _refresh(ref),
              ),
            ],
          ),
          subtitle: member.expired_at==0? Text('尚未购买任何套餐'): Text(DateTime.fromMillisecondsSinceEpoch(
              member.expired_at! * 1000)
              .toString()),
        ),

        // 退出按钮（仅当用户已登录时显示）
        if (member.id != -1)
          ListItem(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text("退出登录", style: TextStyle(color: Colors.red)),
            onTap: () => _logout(ref),
          ),
      ],
    );
  }

  Future<void> _logout(WidgetRef ref) async {
    // 触发退出登录逻辑
    ref.read(memberProvider.notifier).logout(); // 调用 provider 处理退出

    /// 清理webdav信息
    globalState.appController.clearWebDAV();
    // 清理缓存
    await SpUtil.clear();
  }

  void _refresh(WidgetRef ref) {
    _getMemberInfo(ref); // 触发 Provider 重新加载数据
  }
  _getMemberInfo(WidgetRef ref) async {
    try {
      var data = await DioUtils.instance.request(Method.post, Api.getMemberInfo,autoDismiss: false);
      print('result=======$data');
      var user = User.fromJson(data['data']);
      ref.read(memberProvider.notifier).updateUser(user);
    } catch (e) {
      throw Exception('请重新登录');
    }
  }
}



class _AccessItem extends StatelessWidget {
  const _AccessItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const Icon(Icons.view_list),
      title: Text(appLocalizations.accessControl),
      subtitle: Text(appLocalizations.accessControlDesc),
      delegate: OpenDelegate(
        title: appLocalizations.appAccessControl,
        widget: const AccessFragment(),
      ),
    );
  }
}

class _OverrideItem extends StatelessWidget {
  const _OverrideItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const Icon(Icons.edit),
      title: Text(appLocalizations.override),
      subtitle: Text(appLocalizations.overrideDesc),
      delegate: OpenDelegate(
        title: appLocalizations.override,
        widget: const ConfigFragment(),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const Icon(Icons.settings),
      title: Text(appLocalizations.application),
      subtitle: Text(appLocalizations.applicationDesc),
      delegate: OpenDelegate(
        title: appLocalizations.application,
        widget: const ApplicationSettingFragment(),
      ),
    );
  }
}

class _DisclaimerItem extends StatelessWidget {
  const _DisclaimerItem();

  @override
  Widget build(BuildContext context) {
    return ListItem(
      leading: const Icon(Icons.gavel),
      title: Text(appLocalizations.disclaimer),
      onTap: () async {
        final isDisclaimerAccepted =
            await globalState.appController.showDisclaimer();
        if (!isDisclaimerAccepted) {
          globalState.appController.handleExit();
        }
      },
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const Icon(Icons.info),
      title: Text(appLocalizations.about),
      delegate: OpenDelegate(
        title: appLocalizations.about,
        widget: const AboutFragment(),
      ),
    );
  }
}
