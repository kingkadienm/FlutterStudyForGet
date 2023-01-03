import 'package:flutter/material.dart';
import 'package:flutter_demo/lanuage/app_language_zh.dart';
import 'package:flutter_demo/lanuage/language_key.dart';
import 'package:flutter_demo/lanuage/app_language_en.dart';

/// @class : default_localizations
/// @date : 2023-01-03 16:50
/// @name : wangzs
/// @description : 
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///AppLanguageEn和AppLanguageZh都继承了AppLanguageKey
  static Map<String, AppLanguageKey> _localizedValues = {
    'en': new AppLanguageEn(),
    'zh': new AppLanguageZh(),
  };

  AppLanguageKey? get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["en"];
  }

  ///通过 Localizations 加载当前的 AppLocalizations
  ///获取对应的 AppLanguageKey
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  ///通过 Localizations 加载当前的 AppLocalizations
  ///获取对应的 AppLanguageKey
  static AppLanguageKey? i18n(BuildContext context) {
    return (Localizations.of(context, AppLocalizations) as AppLocalizations)
        .currentLocalized;
  }
} 