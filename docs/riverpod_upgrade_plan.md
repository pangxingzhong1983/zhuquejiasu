# Riverpod v3 升级路线

## 目标
在保持现有功能稳定的前提下，将 `flutter_riverpod`/`riverpod`/`riverpod_annotation`/`riverpod_generator`/`riverpod_lint` 升级至 3.x 版本，并统一 `ref.watch`/`ref.read` 的使用方式。

## 步骤
1. **创建实验分支**  
   - 新建 `feat/riverpod3-migration` 分支，仅在该分支上尝试升级与迁移。

2. **依赖升级与代码生成**  
   - 修改 `pubspec.yaml` 中所有 Riverpod 相关依赖为 `^3.0.3`。  
   - 执行 `flutter pub upgrade --major-versions flutter_riverpod riverpod riverpod_annotation riverpod_generator riverpod_lint`.
   - 重新运行 `flutter pub run build_runner build --delete-conflicting-outputs` 更新代码生成文件。

3. **API 迁移**  
   - 对照官方迁移指南，逐个修复编译错误：  
     - 调整 `ProviderScope`、`ref.invalidate` 等 API 变化。  
     - 对 `ref.watch` 仅用于监听、`ref.read` 仅用于一次性读取做明确区分。  
     - 将 `ref.listen` 与 `ref.listenManual` 统一成 Riverpod 3 的新写法（`ref.listenManual` 已迁移至 `ref.listen` 并返回 `ProviderSubscription`）。

4. **状态访问规范**  
   - 为每个 Provider 标注预期用法：  
     - UI 层：优先使用 `ref.watch`/`ConsumerWidget`。  
     - 业务层/Controller：统一使用 `ref.read` 获取一次性值，若需监听则显式建立订阅并在 `dispose` 中取消。  
   - 增加 `docs/riverpod_usage.md` 说明文档，并在审查阶段核对。

5. **测试矩阵**  
   - Android/macOS/Windows 各构建一次。  
   - 运行现有自动化测试（如有）。  
   - 手工验证关键流程：登录、WebDAV 同步、快连/断连、配置恢复、节点切换等。

6. **代码审查与合并**  
   - 迁移完成后发起 PR，在审查时重点关注 Provider 行为是否一致、是否存在多余重建。  
   - 等待 QA 验证通过后合并至主分支。

## 风险与缓解
- **编译器错误数量大**：逐文件修复，并记录常见模式以便复用。  
- **状态抖动或重复请求**：通过日志与 Riverpod DevTools 观察 Provider rebuild 次数，必要时引入 `ProviderContainer` 快照对比。  
- **联动依赖变动**：关注 `hooks_riverpod`、`riverpod_lint` 的额外要求，保持同版本升级。  
- **回滚策略**：若迁移失败，直接回到主分支，保留实验分支用于后续迭代。

## 时间预估
- 依赖升级与初次编译修复：1~2 天  
- API 迁移与规范落地：2~3 天  
- 多平台验证与文档：1 天  
- 总计：约 4~6 天的集中工作量
