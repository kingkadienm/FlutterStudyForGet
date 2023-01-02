import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/base/getx_controller_inject.dart';
import 'package:flutter_demo/routes/routes.dart';
import 'package:get/get.dart';



/// @class : SplashController
/// @date : 2023/01/02
/// @name : wangzs
/// @description :启动页 控制器层
class SplashController extends BaseGetController {


  @override
  void onInit() {
    super.onInit();
    print("开始加载？？？");
    lazyInitAnim();
  }

  lazyInitAnim(){
    Future.delayed(const Duration(milliseconds: 300), () {
      print('倒计时 结束？？？？');
       update();
      Get.offNamed(

            Routes.homePage);
    });
  }


}
