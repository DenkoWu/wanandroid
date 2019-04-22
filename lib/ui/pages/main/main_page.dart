import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/http/dio_util.dart';
import 'package:wanandroid/ui/pages/main/project_page.dart';
import 'package:wanandroid/values/colors.dart';

import 'home_page.dart';
import 'hot_page.dart';
import 'main_left_page.dart';
import 'more_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

//首页tab
class HomeTab {
  String title;
  IconData iconData;

  HomeTab(this.title, this.iconData);
}

List<HomeTab> homeTabs = new List();
int _selectIndex = 0;

class _MainPageState extends State<MainPage> {
  //初始化数据
  @override
  void initState() {
    _init();
//    setLocalizedValues(localizedValues);
    homeTabs.add(HomeTab("主页", Icons.home));
    homeTabs.add(HomeTab("热门", Icons.whatshot));
    homeTabs.add(HomeTab("项目", Icons.next_week));
    homeTabs.add(HomeTab("更多", Icons.more));
  }

  void _init() {
//    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Api.BaseURL;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  var _pageController = new PageController(initialPage: _selectIndex);

  void _onBottomTapped(int index) {
    setState(() {
      _selectIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(homeTabs[_selectIndex].title),
        ]),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      body: PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return buildTabView(context, homeTabs[index]);
        },
        itemCount: homeTabs.length,
      ),
      drawer: Drawer(
          child: Drawer(
        child: MainLeftPage(),
      )),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          fixedColor: Colors.green,
          unselectedItemColor: Colours.green_a7,
          onTap: _onBottomTapped,
          currentIndex: _selectIndex,
          items: homeTabs.map((tab) {
            return BottomNavigationBarItem(
                title: Text(tab.title), icon: Icon(tab.iconData));
          }).toList()),
    );
  }

  void _pageChange(int index) {

    setState(() {
      _selectIndex = index;
    });
  }

  Widget buildTabView(BuildContext context, HomeTab page) {
    String labelId = page.title;
    LogUtil.e("HomePage build......" + labelId);
    switch (_selectIndex) {
      case 0:
        return HomePage(labelId: labelId);
        break;
      case 1:
        return HotPage(labelId: labelId);
        break;
      case 2:
        return ProjectPage(labelId: labelId);
        break;
      case 3:
        return MorePage(labelId: labelId);
        break;
      default:
        return Container();
        break;
    }
  }
}
