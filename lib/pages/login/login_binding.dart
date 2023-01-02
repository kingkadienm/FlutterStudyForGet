import 'package:flutter_demo/pages/login/login_controller.dart';
import 'package:get/get.dart';

/// @class : login_binding
/// @date : 2023-01-02 20:10
/// @name : wangzs
/// @description : 
class LoginBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => LoginController());
  }

}