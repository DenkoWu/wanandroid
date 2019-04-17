import 'package:flutter/material.dart';

class HotPage extends StatefulWidget {
  final String labelId;
  //重载构造方法
  const HotPage({Key key,this.labelId}):super(key:key);

  @override
  _HotPageState createState() => _HotPageState(labelId);
}

class _HotPageState extends State<HotPage> {
  String title;
  _HotPageState(String content){
    this.title=content;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("热门"),
    );
  }
}
