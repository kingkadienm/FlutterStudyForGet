import 'package:flutter_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';

/// @class : home_binding
/// @date : 2023-01-02 20:11
/// @name : wangzs
/// @description :

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
