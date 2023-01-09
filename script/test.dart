import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:mirrors';

/// @class : test
/// @date : 2023-01-05 18:27
/// @name : wangzs
/// @description :

var fileName = 'app_en.json';

//
File sourceFile = File('D:\\workspeace\\FlutterStudyForGet\\lib');
String tempPath = sourceFile.path;
String path = '${sourceFile.path}\\language';
File languageRes = File('${sourceFile.path}\\res\\r.dart');
File languageString = File('${sourceFile.path}\\res\\strings.dart');

///AppLanguageZh
///AppLanguageEn
main() {
  var fileDirectory = File(path);
  print(' file path ${fileDirectory.path}');
  if (fileDirectory.statSync().type == FileSystemEntityType.directory) {
    print('是文件夹');
    Directory(path)
        .list(recursive: true, followLinks: false)
        .toList()
        .then((value) => {traverseSubFile(value)})
        .onError((error, stackTrace) => {throw ('读取lin/l10n出错')});
  } else {
    var file = File('$path\\$fileName');
    file
        .create(recursive: true)
        .then((value) => {writeTitle(file)})
        .onError((error, stackTrace) => throw ('创建文件失败'));
  }
}

findLanguageFile(List<FileSystemEntity> entityList) {}

///获取lib/l10n文件下的子文件
traverseSubFile(List<FileSystemEntity> entityList) async {
  print('object');
  var subFileName = [];
  for (var value1 in entityList) {
    var split = value1.path.split('\\');
    subFileName.add(split[split.length - 1]);
  }

  if (subFileName.contains(fileName)) {
    ///包含
    print('包含');
    var languageFile = File('$path\\$fileName');
    var content = languageFile.readAsStringSync();
    print(content);
    if (content.isEmpty) {
      writeTitle(languageFile);
    } else {
      if (await languageRes.exists()) {
        /// res/strings.dart 存在
        writeContent(content);
      } else {
        languageRes
            .create(recursive: true)
            .then((value) => {writeContent(content)})
            .onError((error, stackTrace) => throw ('创建lib/res/strings.dart失败'));
      }
    }
  } else {
    ///不包含
    print('不包含');
    createSimpFile();
  }
}

writeContent(String content) {
  print('start write content for {}');
  var ioSink = languageRes.openWrite(mode: FileMode.write);
  ioSink.writeln('import \'strings.dart\';');
  ioSink.writeln('class R{');
  ioSink.writeln('''
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
  ''');
  ioSink.writeln('}');

  // Map<String, dynamic> jsonContent = jsonDecode(content);
  // var keys = jsonContent.keys;
  // for (var value in keys) {
  //   print('"$value":"${jsonContent[value]}');
  // }
  createStringsFile(content);
}

createStringsFile(String content) async {
  if (await languageString.exists()) {
    /// res/strings.dart 存在
    writeStringsContent(content);
  } else {
    languageString
        .create(recursive: true)
        .then((value) => {writeStringsContent(content)})
        .onError((error, stackTrace) => throw ('创建lib/res/strings.dart失败'));
  }
}

writeStringsContent(String content) {
  print('start write languageString for  ');
  var ioSink = languageString.openWrite(mode: FileMode.write);
  ioSink.writeln('class Strings{');
  ioSink.writeln('''
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
  ''');

  Map<String, dynamic> jsonContent = jsonDecode(content);
  var keys = jsonContent.keys;
  for (var value in keys) {
    ioSink.writeln('"$value":"${jsonContent[value]}');
  }

  ioSink.writeln('}');
}

createSimpFile() {
  var file = File('$path\\$fileName');
  print(file.path);
  file
      .create(recursive: true)
      .then((value) => {writeTitle(file)})
      .onError((error, stackTrace) => throw ('创建文件失败'));
}

writeTitle(var file) async {
  print(' write contnt');
  IOSink isk = file.openWrite(mode: FileMode.write);
  // 多次写入
  isk.write('{}');
  await isk.close();
}
