
import 'package:get/get.dart';
import '../fragments/login.dart';




class RouteGet {
  ///启动页
  // static const String splash = "/splash";
  static const String main = "/main";

  ///欢迎页
  static const String welcome = "/welcome";

  ///登录页
  static const String login = "/loginPage";

  ///注册
  static const register = "/register";

  ///忘记密码
  static const forgetPwd = "/forgetPwd";

  ///密码登录
  static const String loginPsw = "/loginPsw";

  ///忘记密码
  static const String loginForgetPsw = "/loginForgetPsw";
  static const String chat = '/ChatPage';



  ///pages map
  static final List<GetPage> getPages = [
    GetPage(name: login, page: () => const LoginFragment()),

  ];
}
