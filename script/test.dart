// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
// import 'dart:mirrors';
//
// /// @class : test
// /// @date : 2023-01-05 18:27
// /// @name : wangzs
// /// @description :
//
// var fileName = 'app_en.json';
//
// //
// File sourceFile = File('E:\\workspace\\FlutterSpace\\flutter_demo\\lib');
// String tempPath = sourceFile.path;
// String path = '${sourceFile.path}\\language';
// File languageRes = File('${sourceFile.path}\\res\\r.dart');
// File languageString = File('${sourceFile.path}\\res\\strings.dart');
// var subFileName = [];
//
// ///AppLanguageZh
// ///AppLanguageEn
// main() {
//   var fileDirectory = File(path);
//   print(' file path ${fileDirectory.path}');
//   if (fileDirectory.statSync().type == FileSystemEntityType.directory) {
//     print('是文件夹');
//     Directory(path)
//         .list(recursive: true, followLinks: false)
//         .toList()
//         .then((value) => {traverseSubFile(value)})
//         .onError((error, stackTrace) => {throw ('读取lin/l10n出错')});
//   } else {
//     var file = File('$path\\$fileName');
//     file
//         .create(recursive: true)
//         .then((value) => {writeTitle(file)})
//         .onError((error, stackTrace) => throw ('创建文件失败'));
//   }
// }
//
// findLanguageFile(List<FileSystemEntity> entityList) {}
// String testStr='';
// ///获取lib/l10n文件下的子文件
// traverseSubFile(List<FileSystemEntity> entityList) async {
//   for (var value1 in entityList) {
//     var split = value1.path.split('\\');
//     if (split.length > 0) {
//       var split2 = split[split.length - 1];
//       if (split2.startsWith('app_') && split2.endsWith('.json')) {
//         subFileName.add(split[split.length - 1]);
//       }
//     }
//   }
//
//   if (subFileName.isEmpty) {
//     /// lib/language/ 文件夹下面是空的  创建固定文件app_en.json
//     print('lib/language/ 文件夹下面是空的  创建固定文件app_en.json');
//     createSimpFile();
//   } else {
//     for (String value in subFileName) {
//       print(' lib/language/$value');
//       ///app_en.json
//       var substring =
//       value.substring(value.lastIndexOf('_') + 1, value.lastIndexOf('.'));
//       print('当前语言$substring');
//       var languageFile = File('$path\\$value');
//       var content = languageFile.readAsStringSync();
//       if (content.isEmpty) {
//         writeTitle(languageFile);
//       } else {
//         testStr +='        \'$substring\': ';
//         Map<String, dynamic> jsonContent = jsonDecode(content);
//         var keys = jsonContent.keys;
//         print(jsonContent);
//         testStr += '{\n';
//         for (var value in keys) {
//           // print('"          $value ": "\'${jsonContent[value]}\'",');
//           testStr +='          Strings.getInstance().$value: \'${jsonContent[value]}\',\n';
//         }
//         testStr+='        },\n';
//         if (await languageRes.exists()) {
//           /// res/strings.dart 存在
//           writeContent();
//           createStringsFile(content);
//         } else {
//           languageRes
//               .create(recursive: true)
//               .then((value) => {
//             writeContent(),
//             createStringsFile(content)
//           })
//               .onError(
//                   (error, stackTrace) => throw ('创建lib/res/strings.dart失败'));
//         }
//       }
//
//     }
//     print(testStr);
//   }
// }
// // createMessageFile(languageType, content);
//
// /**
//  * 创建R文件
//  */
// writeContent() {
//   print('start write content for {}');
//   var ioSink = languageRes.openWrite(mode: FileMode.write);
//   ioSink.writeln('import \'strings.dart\';');
//   ioSink.writeln('');
//   ioSink.writeln('///  Generated file. Do not edit');
//   ioSink.writeln('class R{');
//   ioSink.writeln('''
//   /// 单例对象
//   static R? _instance;
//
//   /// 内部构造方法，可避免外部暴露构造函数，进行实例化
//   R._internal();
//
//   /// 工厂构造方法，这里使用命名构造函数方式进行声明
//   factory R.getInstance() => _getInstance();
//
//   /// 获取单例内部方法
//   static _getInstance() {
//     // 只能有一个实例
//     _instance ??= R._internal();
//     return _instance;
//   }
//
//   Strings String() {
//     return Strings.getInstance();
//   }
//   ''');
//   ioSink.writeln('}');
// }
//
// ///创建strings.dart文件
// createStringsFile(String content) async {
//   if (await languageString.exists()) {
//     /// res/strings.dart 存在
//     writeStringsContent(content);
//   } else {
//     languageString
//         .create(recursive: true)
//         .then((value) => {writeStringsContent(content)})
//         .onError((error, stackTrace) => throw ('创建lib/res/strings.dart失败'));
//   }
// }
//
// writeStringsContent(String content) {
//   print('start write languageString for  ');
//   var ioSink = languageString.openWrite(mode: FileMode.write);
//   ioSink.writeln('import \'package:get/get.dart\';\n');
//   ioSink.writeln('///  Generated file. Do not edit');
//   ioSink.writeln('class Strings {');
//   ioSink.writeln('''
//   /// 单例对象
//   static Strings? _instance;
//
//   /// 内部构造方法，可避免外部暴露构造函数，进行实例化
//   Strings._internal();
//
//   /// 工厂构造方法，这里使用命名构造函数方式进行声明
//   factory Strings.getInstance() => _getInstance();
//
//   /// 获取单例内部方法
//   static _getInstance() {
//     // 只能有一个实例
//     _instance ??= Strings._internal();
//     return _instance;
//   }
//   ''');
//
//   Map<String, dynamic> jsonContent = jsonDecode(content);
//   var keys = jsonContent.keys;
//   for (var value in keys) {
//     ioSink.writeln('  String $value = \'$value\';');
//   }
//   ioSink.writeln('}');
//   print('开始写入 多语言');
//   String message = '''
//
// class Message extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
// $testStr
//       };
// }
//   ''';
//   ioSink.writeln(message);
//   ioSink.close();
// }
//
// createMessageFile(String languageType, String content) {
//   // var ioSink = languageString.openWrite(mode: FileMode.append);
//
//   // ioSink.close();
// }
//
// createSimpFile() {
//   var file = File('$path\\$fileName');
//   print(file.path);
//   file
//       .create(recursive: true)
//       .then((value) => {writeTitle(file)})
//       .onError((error, stackTrace) => throw ('创建文件失败'));
// }
//
// writeTitle(var file) async {
//   print(' write contnt');
//   IOSink isk = file.openWrite(mode: FileMode.write);
//   // 多次写入
//   isk.write('{}');
//   await isk.close();
// }
