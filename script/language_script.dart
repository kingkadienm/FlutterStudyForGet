import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:flutter_demo/lanuage/app_language_zh.dart';
import 'package:flutter_demo/lanuage/language_key.dart';
import 'package:flutter_demo/lanuage/app_language_en.dart';
/// @class : test
/// @date : 2023-01-05 18:27
/// @name : wangzs
/// @description :

var fileName = 'app_en.json';

//
File sourceFile = File('E:\\workspace\\FlutterSpace\\flutter_demo\\lib');
String tempPath = sourceFile.path;
String path = '${sourceFile.path}\\language';
var appLanguageKey = AppLanguageKey;

var sourceLanguage = {
  // 'languageKey': AppLanguageKey(),
  'zh': AppLanguageZh(),
  'en': AppLanguageEn(),
};

///AppLanguageZh
///AppLanguageEn
main() {
  var keys = sourceLanguage.keys;

  ClassMirror languageKey = reflectClass(appLanguageKey);
  var declarations = languageKey.declarations;
  var values = declarations.values;

  // print( MirrorSystem.getName(value.simpleName));
  for (var value in keys) {
    for (var nameValue in values) {
      var name = MirrorSystem.getName(nameValue.simpleName);
      if (value != 'languageKey') {
        var languageSource = sourceLanguage[value];
        ClassMirror classM = reflectClass(languageSource.runtimeType);
        late Symbol constructorSymbol;
        for (DeclarationMirror declaration in classM.declarations.values) {
          if (declaration is MethodMirror && declaration.isConstructor) {
            constructorSymbol = declaration.constructorName;
          }
        }
        InstanceMirror instance = classM.newInstance(constructorSymbol, []);
        if (name != appLanguageKey.toString()) {
          var field = instance.getField(nameValue.simpleName);
          print('"$name":"${field.reflectee}"');
        }
      }
    }
  }
}

findLanguageFile(List<FileSystemEntity> entityList) {}

///获取lib/l10n文件下的子文件
traverseSubFile(List<FileSystemEntity> entityList) {
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
    Map<String, dynamic> jsonContent = jsonDecode(content);

    var keys = jsonContent.keys;
    for (var value in keys) {
      print('"$value":"${jsonContent[value]}');
    }

    // var content = languageFile.readAsString().then((value) => {
    //
    //   print(value)
    // });

  } else {
    ///不包含
    print('不包含');
    createSimpFile();
  }
}

createSimpFile() {
  var file = File('$path\\app_en.json');
  print(file.path);
  file
      .create(recursive: true)
      .then((value) => {})
      .onError((error, stackTrace) => throw ('创建文件失败'));
}
