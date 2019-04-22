import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/blocs/application_bloc.dart';
import 'package:wanandroid/blocs/bloc_provider.dart';
import 'package:wanandroid/blocs/main_bloc.dart';
import 'package:wanandroid/common/sp_helper.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/http/dio_util.dart';
import 'package:wanandroid/model/language_model.dart';
import 'package:wanandroid/ui/pages/main/main_page.dart';
import 'package:wanandroid/values/colors.dart';
import 'package:wanandroid/values/strings.dart';


//void main() => runApp(MyApp());
void main() => runApp(BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider(child: MyApp(), bloc: MainBloc()),
    ));

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
class HomeTab {
  String title;
  IconData iconData;

  HomeTab(this.title, this.iconData);
}

class _MyAppPageState extends State<MyAppPage> {
  Locale _locale;
  Color _themeColor = Colours.app_main;

  @override
  void initState() {
    setLocalizedValues(localizedValues);
    _init();
    _initAsync();
    _initListener();
  }

  void _init() {
    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Api.BaseURL;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      _loadLocale();
    });
  }

  void _loadLocale() {
    setState(() {
      LanguageModel model = SpHelper.getLanguageModel();
      if (model != null) {
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }

      String _colorKey = SpHelper.getThemeColor();
      if (themeColorMap[_colorKey] != null)
        _themeColor = themeColorMap[_colorKey];
    });
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _loadLocale();
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
