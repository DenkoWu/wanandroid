import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/model/home_list.dart';
import 'package:wanandroid/utils/navigator_util.dart';
import 'package:wanandroid/values/_res_index.dart';

class ListViewItem extends StatefulWidget {
  DatasListBean data;

  @override
  _ListViewItemState createState() => _ListViewItemState(data: data);

  ListViewItem({Key key, this.data}) : super(key: key) {}
}

class _ListViewItemState extends State<ListViewItem> {
  DatasListBean data;
  _ListViewItemState({Key key, this.data});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
//      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),//设置圆角
      elevation: 0.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
//        contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
        onTap: () {
          LogUtil.e("点击了"+data.author);
          NavigatorUtil.pushWeb(context, title: data.author, url: data.link);
          // _launchURL(itemUrl, context);
//          Application.router.navigateTo(context, '${Routes.webViewPage}?title=${Uri.encodeComponent(itemTitle)}&url=${Uri.encodeComponent(itemUrl)}');
        },
//        title: Padding(
//          child: Text(
//            "测试",
//            style: TextStyle(color: Colors.black, fontSize: 15.0),
//          ),
//          padding: EdgeInsets.only(top: 10.0),
//        ),
        subtitle: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(data.superChapterName,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18.0)),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  ),
                  Padding(
                    child: Text(data.title,
                        maxLines: 1,
                        overflow:  TextOverflow.ellipsis,
                        style:
                            TextStyle(color: Colours.green_1, fontSize: 12.0)),
                    padding: EdgeInsets.only(bottom: 10.0),
                  ),
                  Padding(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("作者："+data.author,
                              style:
                              TextStyle(color: Colors.black54, fontSize: 10.0)),
                        ),
                        Text(data.niceDate,
                            style:
                            TextStyle(color: Colors.grey, fontSize: 12.0))
                      ],
                    ),
                    padding: EdgeInsets.only( bottom: 10.0),
                  ),
                ],
              ),
            ),
//            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0)
          ],
        ),

//          trailing:
//                Icon(Icons.keyboard_arrow_right,
//                    color: Colors.grey, size: 30.0),
      ),
    );
  }
}
