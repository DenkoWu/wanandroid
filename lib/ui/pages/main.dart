import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/http/dio_util.dart';
import 'package:wanandroid/values/colors.dart';
import 'package:wanandroid/values/strings.dart';

import 'main/main_left_page.dart';
import 'main/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter学习",
      theme: ThemeData(
          //主题色
          primarySwatch: Colors.green),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

//首页tab
class HomeTab{
  String title;
  IconData iconData;
  HomeTab(this.title, this.iconData);
}

class _MyAppPageState extends State<MyAppPage> {
  Color _themeColor = Colours.app_main;

  @override
  void initState() {
    _init();
  }

  void _init() {
//    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Api.BaseURL;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
//    _loadLocale();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
          '/MainPage': (ctx) => MainPage(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: _themeColor,
        accentColor: _themeColor,
        indicatorColor: Colors.white,
      ),
      home: MainPage(),
    );
  }


}


