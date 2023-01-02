import 'package:flutter_demo/pages/register/register_controller.dart';
import 'package:get/get.dart';

/// @class : register_binding
/// @date : 2023-01-02 20:11
/// @name : wangzs
/// @description : 

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
