import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_demo/pages/splash/splash_binding.dart';
import 'package:flutter_demo/pages/splash/splash_page.dart';
import 'package:flutter_demo/res/strings.dart';
import 'package:flutter_demo/routes/routes.dart';
import 'package:flutter_demo/utils/injection_init.dart';
import 'package:flutter_demo/utils/keyboard_util.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(GetMaterialApp(
    getPages: Routes.routePage,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    title: 'ddd',
    builder: (context, child) => Scaffold(

      // Global GestureDetector that will dismiss the keyboard
      body: GestureDetector(
        onTap: () {
          KeyboardUtils.hideKeyboard(context);
        },
        child: child,
      ),
    ),

    ///主题颜色
    // theme: appThemeData,

    ///国际化支持-来源配置
    translations: Message(),

    ///国际化支持-默认语言
    // locale: LocaleOptions.getDefault(),

    ///国际化支持-备用语言
    fallbackLocale: const Locale('en', 'US'),

    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
    home: const SplashPage(),
  ));
}
