import 'package:flutter_demo/pages/android/android_bindings.dart';
import 'package:flutter_demo/pages/android/to_android_view.dart';
import 'package:flutter_demo/pages/home/home_binding.dart';
import 'package:flutter_demo/pages/home/home_page.dart';
import 'package:flutter_demo/pages/login/login_binding.dart';
import 'package:flutter_demo/pages/login/login_page.dart';
import 'package:flutter_demo/pages/register/register_binding.dart';
import 'package:flutter_demo/pages/register/register_page.dart';
import 'package:flutter_demo/pages/splash/splash_binding.dart';
import 'package:flutter_demo/pages/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

/// @class : Routes
/// @date : 2023-01-02 19:39
/// @name : wangzs
/// @description : 路由表
class Routes {
  ///入口模块
  static const String splashPage = '/splash';

  ///登录模块
  static const String loginPage = '/login';

  ///注册
  static const String registerPage = '/register';

  ///主页
  static const String homePage = '/home';
  ///android 原生
  static const String androidPage = '/android';

  ///页面合集
  static final routePage = [
    GetPage(
        name: splashPage,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: registerPage,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: homePage,
        page: () =>   HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: androidPage,
        page: () =>   ToAndroidView(),
        binding: AndroidBindings()),
  ];
}
