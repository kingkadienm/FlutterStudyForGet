import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/lanuage/default_localizations.dart';

/// @class : localizations_delegate
/// @date : 2023-01-03 16:48
/// @name : wangzs
/// @description :
class AppLocalizationsDelegate {
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

}
