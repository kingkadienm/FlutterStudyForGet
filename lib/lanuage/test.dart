import 'package:flutter/material.dart';
import 'package:flutter_demo/lanuage/app_language_en.dart';
import 'package:flutter_demo/lanuage/language_key.dart';
import 'package:flutter_demo/lanuage/localizations_delegate.dart';
import 'package:get/get.dart';



/// @class : test
/// @date : 2023-01-03 17:50
/// @name : wangzs
/// @description :
class TestLanguage extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    messages.localeName: messages.messages,
        // 'pt_BR': messages_zh.messages,
      };
}

final messages = new MessageLookup();


class MessageLookup {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, String> _notInlinedMessages(_) => <String, String>{
        "changeLanguage": ("Change Language"),
        "language_en": ("English"),
        "language_zh": ("Simplified Chinese"),
        "loading": ("Loading"),
        "title": ("Title")
      };
}
