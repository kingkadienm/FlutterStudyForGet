import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/base/get_common_view.dart';
import 'package:flutter_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';

/// @class : home_page
/// @date : 2023-01-02 20:11
/// @name : wangzs
/// @description :
class HomePage extends GetCommonView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  var items = [Colors.red, Colors.black, Colors.blue, Colors.amberAccent];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('aaa'),
        ),
        body:  ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 0.5),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: items[index],
                child: Text(
                  'item $index',
                  style: TextStyle(height: 10),
                ),
              ),
              onTap: () {
                Get.changeTheme(ThemeData.light().copyWith(
                  scaffoldBackgroundColor:items[index],
                  appBarTheme: AppBarTheme(
                      backgroundColor:items[index],
                      titleTextStyle:
                      TextStyle( color: items[index])),
                ));
              },
            );
          },
        ) ,
      )
    ;
  }
}
