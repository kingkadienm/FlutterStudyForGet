import 'package:get/get.dart';

///  Generated file. Do not edit
class Strings {
  /// 单例对象
  static Strings? _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  Strings._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory Strings.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    _instance ??= Strings._internal();
    return _instance;
  }

  String loading = 'loading';
  String title = 'title';
  String changeLanguage = 'changeLanguage';
  String language_zh = 'language_zh';
  String language_en = 'language_en';
}

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          Strings.getInstance().loading: 'Loading',
          Strings.getInstance().title: 'Title',
          Strings.getInstance().changeLanguage: 'Change Language',
          Strings.getInstance().language_zh: 'Simplified Chinese',
          Strings.getInstance().language_en: 'English',
        },
        'zh_CN': {
          Strings.getInstance().loading: '加载中',
          Strings.getInstance().title: '标题',
          Strings.getInstance().changeLanguage: '切换语言',
          Strings.getInstance().language_zh: '简体中文',
          Strings.getInstance().language_en: '英文',
        },

      };
}

