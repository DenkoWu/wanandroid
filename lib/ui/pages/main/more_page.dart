import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  final String labelId;
  //重载构造方法
  const MorePage({Key key,this.labelId}):super(key:key);

  @override
  _MorePageState createState() => _MorePageState(labelId);
}

class _MorePageState extends State<MorePage> {
  String title;
  _MorePageState(String content){
    this.title=content;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("更多"),
    );
  }
}
