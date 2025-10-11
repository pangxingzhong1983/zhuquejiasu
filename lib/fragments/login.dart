import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sp_util/sp_util.dart';
import '../models/user.dart';
import '../net/api.dart';
import '../net/dioutils.dart';
import '../providers/app.dart';
import '../utils/toast_utils.dart';

class LoginFragment extends ConsumerStatefulWidget {
  const LoginFragment({super.key});

  @override
  _LoginFragmentState createState() => _LoginFragmentState();
}

class _LoginFragmentState extends ConsumerState<LoginFragment> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _inviteCodeController = TextEditingController();
  bool _isLoading = false;
  final bool _isRegistering = false;

  // 添加邮箱验证正则表达式
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // 添加邮箱验证方法
  bool _isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }

  Future<void> _login() async {
    setState(() => _isLoading = true);
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (!_isValidEmail(username)) {
      ToastUtils.showToast('请输入有效的邮箱地址');
      setState(() => _isLoading = false);
      return;
    }


    await DioUtils.instance.request(Method.post, Api.login, params: {
      "email": username,
      "password": password
    }, onSuccess: (data) async {
      SpUtil.putString("token", data['data']['token'])?.then((value) async {
        await _getMemberInfo();
        Navigator.pop(context);
      });
    }, autoDismiss: false);

    setState(() => _isLoading = false);
  }

  Future<void> _register() async {
    setState(() => _isLoading = true);
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("密码与确认密码不一致")));
      setState(() => _isLoading = false);
      return;
    }
    if (!_isValidEmail(_usernameController.text)) {
      ToastUtils.showToast('请输入有效的邮箱地址');
      setState(() => _isLoading = false);
      return;
    }

    await DioUtils.instance.request(Method.post, Api.register, params: {
      "email": _usernameController.text,
      "password": _passwordController.text,
      'invite_code': _inviteCodeController.text
    }, onSuccess: (data) async {
      SpUtil.putString("token", data['data']['token'])?.then((value) async {
        await _getMemberInfo();
        Navigator.pop(context);
      });
    }, autoDismiss: false);

    setState(() => _isLoading = false);
  }

  Future<void> _getMemberInfo() async {
    var data = await DioUtils.instance.request(Method.post, Api.getMemberInfo, autoDismiss: false);
    var user = User.fromJson(data['data']);
    ref.read(memberProvider.notifier).updateUser(user);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 520;
    final maxWidth = isDesktop ? 420.0 : size.width * 0.9;
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: maxWidth,
        ),
        width: isDesktop ? maxWidth : null,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   _isRegistering ? "注册" : "登录",
                //   style: Theme.of(context).textTheme.headlineMedium,
                // ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _buildTextField(_usernameController, Icons.email, "邮箱"),
                        _buildTextField(_passwordController, Icons.lock, "密码", obscureText: true),
                        if (_isRegistering) ...[
                          _buildTextField(_confirmPasswordController, Icons.lock, "确认密码", obscureText: true),
                          _buildTextField(_inviteCodeController, Icons.code, "邀请码(选填)"),
                        ],
                        const SizedBox(height: 20),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : OutlinedButton(
                          style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
                          onPressed: _isRegistering ? _register : _login,
                          child: Text("登录"),
                          // child: Text(_isRegistering ? "注册" : "登录"),
                        ),
                        const SizedBox(height: 10),
                        // OutlinedButton(
                        //   onPressed: () => setState(() => _isRegistering = !_isRegistering),
                        //   child: Text(_isRegistering ? "已有账号? 登录" : "没有账号? 注册"),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildTextField(TextEditingController controller, IconData icon, String label, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
