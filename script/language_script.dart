import 'dart:io';

/// @class : language_script
/// @date : 2023-01-03 22:35
/// @name : wangzs
/// @description :
var fileName = ['app_en.arb', 'app_zh.arb'];
String path = '${Directory.current.path}\\lib\\l10n';
String tempPath = '${Directory.current.path}\\lib\\res\\strings.dart';

main() async {

  print(Directory.current);
  var fileDirectory = File(path);
  print(' file path ${fileDirectory.path}');
  if (fileDirectory.statSync().type == FileSystemEntityType.directory) {
    Directory(path)
        .list(recursive: true, followLinks: false)
        .toList()
        .then((value) => {traverseSubFile(value)})
        .onError((error, stackTrace) => {throw ('读取lin/l10n出错')});
  } else {
    var file = File('$path\\app_zh.arb');
    file
        .create(recursive: true)
        .then((value) => {})
        .onError((error, stackTrace) => throw ('创建文件失败'));
  }
}

///获取lib/l10n文件下的子文件
traverseSubFile(List<FileSystemEntity> entityList) {
  for (var filename in fileName) {

    for (var value1 in entityList) {
     var split = value1.path.split('\\');

    }

  }
}
// print('获取lib/l10n文件下的子文件${entity.path}');
//       //E:\workspace\FlutterSpace\flutter_demo\lib\l10n\intl_zh.arb
//       var file = File(entity.path);
//       if (file.statSync().type == FileSystemEntityType.file) {
//         ///判断文件夹下面是否有  app_en.arb  app_zh.arb 文件
//         ///有的话就去创建res/strings.dart 文件，没有就创建这俩文件
//         if (fileName.contains(file.path.split('\\'))) {
//
//           file.readAsString().then((value) => {
//           print(value)
//           }).onError((error, stackTrace) =>
//             throw('读取app_en.arb  app_zh.arb 文件内容失败')
//           );
//
//
//           File tempDirectory = File(tempPath);
//
//           if (await tempDirectory.exists()) {
//             print('res/strings.dart 文件存在');
//
//           } else {
//             print('res/strings.dart 不文件存在');
//             tempDirectory
//                 .create(recursive: true)
//                 .then((file) => {})
//                 .onError((error, stackTrace) => throw ('创建文件失败'));
//           }
//         } else {
//           for (var value in fileName) {
//             File languageFile = File('$path\\$value');
//             print('遍历fileName $value');
//             print(languageFile.path);
//             print('创建lib/l10n下面的app_zh.arb、app_en.arb文件');
//             languageFile
//                 .create(recursive: true)
//                 .then((value) => {languageFile.writeAsString('{}')})
//                 .onError((error, stackTrace) =>
//                     throw ('创建app_zh.arb、app_en.arb 文件失败'));
//           }
//         }
//       } else {
//         print('lib/l10n不是文件夹');
//       }
