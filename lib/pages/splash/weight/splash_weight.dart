import 'package:flutter_demo/base/get_common_view.dart';
import 'package:flutter_demo/pages/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';

/// @class : splash_weight
/// @date : 2023-01-02 21:07
/// @name : wangzs
/// @description :
class SplashWidget extends GetCommonView<SplashController> {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("启动页"),
    );
  }
}
