import 'strings.dart';
class R{
  /// 单例对象
  static R? _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  R._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory R.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    _instance ??= R._internal();
    return _instance;
  }

  Strings strings() {
    return Strings.getInstance();
  }
  
}
