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

  String appName = 'appName';
}
