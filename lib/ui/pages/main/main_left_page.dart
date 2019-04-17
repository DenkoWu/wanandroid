import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/common/component_index.dart';
import 'package:wanandroid/ui/pages/test.dart';
import 'package:wanandroid/utils/utils.dart';

class MainLeftPage extends StatefulWidget {
  @override
  _MainLeftPageState createState() => _MainLeftPageState();
}

class PageInfo {
  String titleId;
  IconData iconData;
  Widget page;
  bool withScaffold;

  PageInfo(this.titleId, this.iconData, this.page, [this.withScaffold = true]);
}

class _MainLeftPageState extends State<MainLeftPage> {
  List<PageInfo> _pageInfo = new List(); //item列表
  @override
  void initState() {
    super.initState();
    _pageInfo.add(PageInfo(Ids.titleHome, Icons.collections, TestPage()));
    _pageInfo.add(PageInfo(Ids.titleHome, Icons.collections, TestPage()));
    _pageInfo.add(PageInfo(Ids.titleHome, Icons.collections, TestPage()));
    _pageInfo.add(PageInfo(Ids.titleHome, Icons.collections, TestPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().statusBarHeight, left: 10.0),
            child: new SizedBox(
              height: 120.0,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 64.0,
                        height: 64.0,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    Utils.getImgPath('ali_connors')))),
                      ),
                      Text(
                        "科少",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "个人简介",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: new Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        iconSize: 20,
                        onPressed: null),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                PageInfo pageinfo = _pageInfo[index];
                return ListTile(
                  leading: Icon(pageinfo.iconData),
                  title: Text(pageinfo.titleId),
                  onTap: () {},
                );
              },
              padding: const EdgeInsets.all(0.0),
              itemCount: _pageInfo.length,
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}

//,new Expanded(
//child: new ListView.builder(
//padding: const EdgeInsets.all(0.0),
//itemCount: _pageInfo.length,
//itemBuilder: (BuildContext context, int index) {
//PageInfo pageInfo = _pageInfo[index];
//return new ListTile(
//leading: new Icon(pageInfo.iconData),
//title:
//new Text( pageInfo.titleId),
//onTap: () {
//
//},
//);
//}),
//flex: 1,
//)
