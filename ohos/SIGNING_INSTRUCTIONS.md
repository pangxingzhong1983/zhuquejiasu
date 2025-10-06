步骤（在 DevEco Studio 中操作）：

1. 打开项目（指向本仓库的 ohos 目录）。
2. 打开 Project Structure → Signing Configs（或 IDE 等效位置）。
3. 新建签名配置，选择 HarmonyOS 类型：
   - Keystore File：选择你的 PKCS#12（例如 /Users/youruser/workspace/ZhuqueHarmony.p12）。
   - Keystore password / Key password：输入密钥库密码（若原密码长度不足，请先用更长密码重新导出 p12）。
   - Key alias：选择或输入 lifeng。
4. 点击“Apply to project”或“Export signing material”（IDE 会在项目内生成按 hvigor 要求的 material 目录：ohos/material/fd、ac、ce）。
5. 导出后，返回命令行在 ohos 目录运行：
   /Applications/DevEco-Studio.app/Contents/tools/hvigor/bin/hvigorw SignApp --debug --stacktrace
6. 若 hvigor 仍报错，把 IDE 导出的 material 目录截图或把 ohos/material 的目录树（不含文件内容）粘贴给我，我来继续验证。

安全说明：
- 切勿把明文密码写入 build-profile.json5 或提交到版本控制。IDE 导出的加密字段会替代此文件中缺失的密码字段。
- 确保 ohos/.gitignore 包含 material / signing 路径以避免泄露。