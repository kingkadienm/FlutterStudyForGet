import 'package:flutter_demo/pages/android/android_controller.dart';
import 'package:get/get.dart';

/// @class : AndroidBindings
/// @date : 2023/7/5 18:18 
/// @name : wangzs
/// @description : 
class AndroidBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AndroidController());
  }
}