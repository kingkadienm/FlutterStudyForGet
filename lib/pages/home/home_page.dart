import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/base/get_common_view.dart';
import 'package:flutter_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

/// @class : home_page
/// @date : 2023-01-02 20:11
/// @name : wangzs
/// @description :
class HomePage extends GetCommonView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  var items = [Colors.red, Colors.black, Colors.blue, Colors.amberAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("111111"),
        ),
        body: Column(
          children: <Widget>[
            FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.androidPage);
                },
                child: Text('1', style: Theme.of(context).textTheme.bodyText1)),

          ],
        ));
  }
}
