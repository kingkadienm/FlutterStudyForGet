import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/base/get_common_view.dart';
import 'package:flutter_demo/pages/android/android_controller.dart';

/// @class : android_view
/// @date : 2023/7/5 16:45 
/// @name : wangzs
/// @description : 

class ToAndroidView extends GetCommonView<AndroidController>{


  static const platform = const MethodChannel('samples.flutter.jumpto.android');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter 跳转 dart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: _jumpToAndroidMethod, child: Text('跳转到Android页面')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  //跳转到Android页面
  Future<Null> _jumpToAndroidMethod() async {
    final String result = await platform.invokeMethod('jumpToAndroidPage');
    print('result===$result');

  }
}