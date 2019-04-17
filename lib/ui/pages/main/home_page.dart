import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String labelId;
  //重载构造方法
  const HomePage({Key key,this.labelId}):super(key:key);

  @override
  _HomePageState createState() => _HomePageState(labelId);
}

class _HomePageState extends State<HomePage> {
  String title;
  _HomePageState(String content){
    this.title=content;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}
