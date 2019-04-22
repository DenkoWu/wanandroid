import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  final String labelId;
  //重载构造方法
  const ProjectPage({Key key,this.labelId}):super(key:key);

  @override
  _ProjectPageState createState() => _ProjectPageState(labelId);
}

class _ProjectPageState extends State<ProjectPage> {
  String title;
  _ProjectPageState(String content){
    this.title=content;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("项目"),
    );
  }
}
