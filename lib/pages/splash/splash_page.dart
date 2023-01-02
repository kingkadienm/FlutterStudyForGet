import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/splash/weight/splash_weight.dart';
import 'package:flutter_demo/utils/screen_util.dart';

/// @class : SplashPage
/// @date : 2023/01/02
/// @name : wangzs
/// @description :启动页 View层
/// class RegisterPage extends GetCommonView<RegisterController> {
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeSystemTransparent(context);

    ///预缓存背景图片
    // precacheImage(const AssetImage(R.assetsImagesLoginBackground), context);
    return const Scaffold(backgroundColor: Colors.red, body: SplashWidget());
  }
}
