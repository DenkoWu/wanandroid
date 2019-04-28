import 'package:flutter/material.dart';

import 'inkwell_utils.dart';

class ListViewItem1 extends StatefulWidget {
  @override
  _ListViewItem1State createState() => _ListViewItem1State();
}

class _ListViewItem1State extends State<ListViewItem1> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 4.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          width: double.infinity,
          height: 100,
          child: Row(
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(
//                        gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0)), //3像素圆角
//                        boxShadow: [ //阴影
//                          BoxShadow(
//                              color:Colors.black54,
//                              blurRadius: 4.0
//                          )
//                        ]
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ))),
              DecoratedBox(
                decoration: BoxDecoration(
//                        gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0)), //3像素圆角
//                        boxShadow: [ //阴影
//                          BoxShadow(
//                              color:Colors.black54,
//                              blurRadius: 4.0
//                          )
//                        ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("name"),
                    Text("name"),
                    Text("name"),
                    Text("name"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
