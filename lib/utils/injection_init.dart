import 'package:flutter_demo/http/request_repository.dart';
import 'package:flutter_demo/lanuage/localizations_delegate.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// @class : Injection
/// @date : 2023-01-02 17:47
/// @name : wangzs
/// @description : 初始化时进行依赖注入，可全局使用
class Injection {
  static Future<void> init() async {
    // shared_preferences
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(() => RequestRepository());

  }
}
