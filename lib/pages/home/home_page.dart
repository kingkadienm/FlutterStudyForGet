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
    return Scaffold(
        appBar: AppBar(
          title: Text("".tr),
        ),
        body: Column(
          children: <Widget>[
            Text('1'),
            Text('1'),
            FloatingActionButton(
                onPressed: () {},
                child: Text('1', style: Theme.of(context).textTheme.bodyText1)),
            FloatingActionButton(onPressed: () {}, child: Text('2')),
            FloatingActionButton(onPressed: () {}, child: Text('3')),
            FloatingActionButton(onPressed: () {}, child: Text('4')),
            Expanded(
                child: ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 0.5),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    color: items[index],
                    child: Text(
                      'item $index',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  onTap: () {
                    Get.changeTheme(ThemeData(
                      scaffoldBackgroundColor: items[index],
                      accentColor: items[index],
                      textTheme: TextTheme(
                        headlineLarge: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            color: items[index]),
                        headline1: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            color: items[index]),
                        headline2: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w400,
                            color: items[index]),
                        headline3: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w400,
                            color: items[index]),
                        headline4: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400,
                            color: items[index]),
                        headline6: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w200,
                            color: items[index]),
                        bodyText1: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200,
                            color: items[index]),
                      ),
                      appBarTheme: AppBarTheme(
                          backgroundColor: items[index],
                          titleTextStyle: TextStyle(color: items[index])),
                    ));
                  },
                );
              },
            ))
          ],
        ));
  }
}
