// ignore_for_file: invalid_annotation_target
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fl_clash/clash/core.dart';
import 'package:fl_clash/common/fileCrypto.dart';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/profile.freezed.dart';
part 'generated/profile.g.dart';

typedef SelectedMap = Map<String, String>;

@freezed
class SubscriptionInfo with _$SubscriptionInfo {
  const factory SubscriptionInfo({
    @Default(0) int upload,
    @Default(0) int download,
    @Default(0) int total,
    @Default(0) int expire,
  }) = _SubscriptionInfo;

  factory SubscriptionInfo.fromJson(Map<String, Object?> json) =>
      _$SubscriptionInfoFromJson(json);

  factory SubscriptionInfo.formHString(String? info) {
    if (info == null) return const SubscriptionInfo();
    final list = info.split(";");
    Map<String, int?> map = {};
    for (final i in list) {
      final keyValue = i.trim().split("=");
      map[keyValue[0]] = int.tryParse(keyValue[1]);
    }
    return SubscriptionInfo(
      upload: map["upload"] ?? 0,
      download: map["download"] ?? 0,
      total: map["total"] ?? 0,
      expire: map["expire"] ?? 0,
    );
  }
}

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    String? label,
    String? currentGroupName,
    @Default("") String url,
    DateTime? lastUpdateDate,
    required Duration autoUpdateDuration,
    SubscriptionInfo? subscriptionInfo,
    @Default(true) bool autoUpdate,
    @Default({}) SelectedMap selectedMap,
    @Default({}) Set<String> unfoldSet,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(false)
    bool isUpdating,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);

  factory Profile.normal({
    String? label,
    String url = '',
  }) {
    return Profile(
      label: label,
      url: url,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      autoUpdateDuration: defaultUpdateDuration,
    );
  }
}


extension ProfilesExt on List<Profile> {
  Profile? getProfile(String? profileId) {
    final index = indexWhere((profile) => profile.id == profileId);
    return index == -1 ? null : this[index];
  }
}

extension ProfileExtension on Profile {
  ProfileType get type =>
      url.isEmpty == true ? ProfileType.file : ProfileType.url;

  bool get realAutoUpdate => url.isEmpty == true ? false : autoUpdate;

  Future<void> checkAndUpdate() async {
    final isExists = await check();
    if (!isExists) {
      if (url.isNotEmpty) {
        await update();
      }
    }
  }

  Future<bool> check() async {
    final profilePath = await appPath.getProfilePath(id);
    return await File(profilePath!).exists();
  }

  Future<File> getFile() async {
    final path = await appPath.getProfilePath(id);
    final file = File(path!);
    final isExists = await file.exists();
    if (!isExists) {
      await file.create(recursive: true);
    }
    return file;
  }

  Future<int> get profileLastModified async {
    final file = await getFile();
    return (await file.lastModified()).microsecondsSinceEpoch;
  }

  Future<Profile> update() async {
    try {
      final response = await request.getFileResponseForUrl(url);
      final disposition = response.headers.value("content-disposition");
      final userinfo = response.headers.value('subscription-userinfo');
      
      // 先验证新配置的有效性，但不影响当前配置
      final newProfile = copyWith(
        label: label ?? other.getFileNameForDisposition(disposition) ?? id,
        subscriptionInfo: SubscriptionInfo.formHString(userinfo),
      );
      
      // 多层验证策略
      await _validateConfigWithFallback(response.data);
      
      // 验证通过后才保存新配置，此时才会真正替换原配置
      return await newProfile.saveFileWithValidation(response.data);
    } catch (e) {
      // 更新失败，原配置保持不变，抛出友好的错误信息
      throw 'Profile update failed: $e';
    }
  }

  /// 多层验证策略，包含降级机制
  Future<void> _validateConfigWithFallback(Uint8List bytes) async {
    try {
      // 第一层：严格验证
      await _validateConfigOffline(bytes);
    } catch (strictError) {
      // 如果严格验证失败，尝试宽松验证
      try {
        await _validateConfigLoose(bytes);
        print('Warning: 配置通过宽松验证，可能存在潜在问题: $strictError');
      } catch (looseError) {
        // 两层验证都失败，拒绝更新
        throw '配置验证失败 - 严格检查: $strictError, 宽松检查: $looseError';
      }
    }
  }

  /// 宽松验证（只检查最关键的部分）
  Future<void> _validateConfigLoose(Uint8List bytes) async {
    final plain = utf8.decode(bytes);
    
    // 1. Clash核心基础验证（必需）
    final message = await clashCore.validateConfig(plain);
    if (message.isNotEmpty) {
      throw '核心配置格式验证失败: $message';
    }
    
    // 2. 最基本的代理检查
    if (!plain.contains('proxies:') && !plain.contains('proxy-providers:')) {
      throw '配置中完全没有代理相关配置';
    }
    
    // 3. 最基本的组检查
    if (!plain.contains('proxy-groups:')) {
      throw '配置中没有代理组配置';
    }
    
    print('配置通过宽松验证：包含基本的代理配置要素');
  }

  /// 快速离线验证配置（不进行网络操作，避免影响当前代理）
  Future<void> _validateConfigOffline(Uint8List bytes) async {
    final plain = utf8.decode(bytes);
    
    // 1. 首先进行基本的配置格式验证（Clash核心验证，离线的，很快）
    final message = await clashCore.validateConfig(plain);
    if (message.isNotEmpty) {
      throw '配置格式验证失败: $message';
    }
    
    // 2. 深度检查配置完整性（离线检查，不进行连通性测试）
    _validateProxiesAvailabilityOffline(plain);
    
    // 3. 记录验证信息，便于调试
    print('配置验证详情: 格式✓ 节点✓ 组✓ 结构✓');
  }

  /// 带验证的保存方法，原子性操作
  Future<Profile> saveFileWithValidation(Uint8List bytes) async {
    final plain = utf8.decode(bytes);
    
    // 再次快速验证（确保安全）
    final message = await clashCore.validateConfig(plain);
    if (message.isNotEmpty) {
      throw message;
    }
    
    final file = await getFile();
    
    // 原子性保存：先写入临时文件，验证成功后再替换原文件
    final tempFile = File('${file.path}.tmp');
    try {
      // 加密后保存到临时文件
      final encrypted = FileCrypto.encryptContent(plain);
      await tempFile.writeAsString(encrypted);
      
      // 验证临时文件是否正确写入
      final tempContent = await tempFile.readAsString();
      if (tempContent != encrypted) {
        throw '临时文件写入验证失败';
      }
      
      // 原子性替换：重命名临时文件为正式文件
      await tempFile.rename(file.path);
      
      return copyWith(lastUpdateDate: DateTime.now());
    } catch (e) {
      // 清理临时文件
      if (await tempFile.exists()) {
        await tempFile.delete();
      }
      throw e;
    }
  }

  /// 离线验证节点可用性（不进行网络操作）
  void _validateProxiesAvailabilityOffline(String configContent) {
    try {
      // 解析YAML配置，检查是否有代理节点
      final yamlContent = configContent.trim();
      if (yamlContent.isEmpty) {
        throw '配置内容为空';
      }
      
      // 1. 基础结构检查
      _validateBasicStructure(yamlContent);
      
      // 2. 代理节点检查
      final hasValidProxies = _validateProxiesSection(yamlContent);
      final hasValidProviders = _validateProxyProviders(yamlContent);
      
      // 至少需要有一种类型的代理配置
      if (!hasValidProxies && !hasValidProviders) {
        throw '配置中未找到任何有效的代理节点或代理提供商';
      }
      
      // 3. 代理组检查
      _validateProxyGroups(yamlContent);
      
      // 4. 规则检查
      _validateRules(yamlContent);
      
      print('离线配置验证通过：包含完整有效的代理配置');
      
    } catch (e) {
      throw '节点可用性验证失败: $e';
    }
  }

  /// 验证基础结构
  void _validateBasicStructure(String content) {
    // 检查是否包含基本的YAML结构标识
    if (!content.contains(':')) {
      throw '配置不是有效的YAML格式';
    }
    
    // 检查是否包含基本的clash配置字段
    final basicFields = ['port', 'mixed-port', 'allow-lan', 'mode'];
    bool hasAnyBasicField = false;
    for (String field in basicFields) {
      if (RegExp('$field\\s*:', multiLine: true).hasMatch(content)) {
        hasAnyBasicField = true;
        break;
      }
    }
    if (!hasAnyBasicField) {
      throw '配置缺少基本的Clash配置字段';
    }
  }

  /// 验证proxies部分
  bool _validateProxiesSection(String content) {
    // 检查是否包含proxies字段
    if (!RegExp(r'proxies\s*:', multiLine: true).hasMatch(content)) {
      return false;
    }
    
    // 检查是否是空数组
    if (RegExp(r'proxies\s*:\s*\[\s*\]', multiLine: true).hasMatch(content) ||
        RegExp(r'proxies\s*:\s*$', multiLine: true).hasMatch(content)) {
      return false;
    }
    
    // 检查是否包含具体的代理节点配置
    final proxyPatterns = [
      r'proxies\s*:\s*\n\s*-\s+name\s*:', // 标准格式
      r'proxies\s*:\s*\n\s*-\s+server\s*:', // 有server字段
      r'proxies\s*:\s*\n\s*-\s+type\s*:', // 有type字段
    ];
    
    for (String pattern in proxyPatterns) {
      if (RegExp(pattern, multiLine: true).hasMatch(content)) {
        // 进一步验证代理节点的完整性
        return _validateProxyNodes(content);
      }
    }
    
    return false;
  }

  /// 验证具体的代理节点
  bool _validateProxyNodes(String content) {
    // 查找所有代理节点块
    final proxyBlockRegex = RegExp(r'proxies\s*:\s*\n((?:\s*-\s+.*\n?)+)', multiLine: true);
    final match = proxyBlockRegex.firstMatch(content);
    
    if (match == null) return false;
    
    final proxiesBlock = match.group(1) ?? '';
    
    // 检查是否包含必要字段（至少要有server和port）
    final hasServer = RegExp(r'server\s*:', multiLine: true).hasMatch(proxiesBlock);
    final hasPort = RegExp(r'port\s*:', multiLine: true).hasMatch(proxiesBlock);
    final hasType = RegExp(r'type\s*:', multiLine: true).hasMatch(proxiesBlock);
    
    if (!hasServer || !hasPort) {
      throw '代理节点配置缺少必要的server或port字段';
    }
    
    if (!hasType) {
      throw '代理节点配置缺少type字段';
    }
    
    return true;
  }

  /// 验证proxy-providers部分
  bool _validateProxyProviders(String content) {
    if (!RegExp(r'proxy-providers\s*:', multiLine: true).hasMatch(content)) {
      return false;
    }
    
    // 检查是否有具体的provider配置
    final providersRegex = RegExp(r'proxy-providers\s*:\s*\n\s+\w+\s*:', multiLine: true);
    if (!providersRegex.hasMatch(content)) {
      return false;
    }
    
    // 检查provider是否包含必要字段
    final providerBlock = RegExp(r'proxy-providers\s*:\s*\n((?:\s+.*\n?)+)', multiLine: true);
    final match = providerBlock.firstMatch(content);
    
    if (match != null) {
      final providersContent = match.group(1) ?? '';
      final hasUrl = RegExp(r'url\s*:', multiLine: true).hasMatch(providersContent);
      final hasType = RegExp(r'type\s*:', multiLine: true).hasMatch(providersContent);
      
      if (!hasUrl && !hasType) {
        throw 'proxy-providers配置缺少必要的url或type字段';
      }
    }
    
    return true;
  }

  /// 验证代理组
  void _validateProxyGroups(String content) {
    if (!RegExp(r'proxy-groups\s*:', multiLine: true).hasMatch(content)) {
      throw '配置缺少proxy-groups字段，无法正常工作';
    }
    
    // 检查是否有具体的组配置
    final groupsRegex = RegExp(r'proxy-groups\s*:\s*\n\s*-\s+', multiLine: true);
    if (!groupsRegex.hasMatch(content)) {
      throw 'proxy-groups配置为空';
    }
    
    // 检查组配置是否包含必要字段
    final groupBlock = RegExp(r'proxy-groups\s*:\s*\n((?:\s*-\s+.*\n?)*)', multiLine: true);
    final match = groupBlock.firstMatch(content);
    
    if (match != null) {
      final groupsContent = match.group(1) ?? '';
      final hasName = RegExp(r'name\s*:', multiLine: true).hasMatch(groupsContent);
      final hasType = RegExp(r'type\s*:', multiLine: true).hasMatch(groupsContent);
      
      if (!hasName || !hasType) {
        throw 'proxy-groups配置缺少必要的name或type字段';
      }
    }
  }

  /// 验证规则
  void _validateRules(String content) {
    // rules字段是可选的，但如果存在应该是有效的
    if (RegExp(r'rules\s*:', multiLine: true).hasMatch(content)) {
      // 检查rules不是空的
      final emptyRulesRegex = RegExp(r'rules\s*:\s*\[\s*\]', multiLine: true);
      final onlyEmptyRules = RegExp(r'rules\s*:\s*$', multiLine: true);
      
      if (emptyRulesRegex.hasMatch(content) || onlyEmptyRules.hasMatch(content)) {
        print('Warning: rules配置为空，可能影响代理行为');
      }
    }
  }

  Future<Profile> saveFile(Uint8List bytes) async {
    final plain = utf8.decode(bytes);
    final message = await clashCore.validateConfig(plain);
    if (message.isNotEmpty) {
      throw message;
    }
    final file = await getFile();
    // 加密后再保存，保证本地与 WebDAV 恢复一致
    final encrypted = FileCrypto.encryptContent(plain);
    await file.writeAsString(encrypted);
    return copyWith(lastUpdateDate: DateTime.now());
  }

  Future<Profile> saveFileWithString(String value) async {
    final message = await clashCore.validateConfig(value);
    if (message.isNotEmpty) {
      throw message;
    }
    final file = await getFile();
    // 加密后再保存，保证本地与 WebDAV 恢复一致
    final encrypted = FileCrypto.encryptContent(value);
    await file.writeAsString(encrypted);
    return copyWith(lastUpdateDate: DateTime.now());
  }
}
