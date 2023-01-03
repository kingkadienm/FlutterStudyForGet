

import 'dart:convert';

import 'package:flutter_demo/utils/sp/sp_key.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @class : SpUtil
/// @date : 2023/01/02
/// @name : wangzs
/// @description :键值对存储
class SpUtil {

  ///存储语言
  ///[Language] 语言
  static updateLanguage(String language) {
    Get.find<SharedPreferences>().remove(SPKey.language);
    Get.find<SharedPreferences>()
        .setString(SPKey.language, language);
  }

}
