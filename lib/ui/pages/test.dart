import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("测试"),
        centerTitle: true,
      ),
      body:  Container(
        width: 100,
        height: 100,
        child: Text("测试"),
      ),
    );
  }
}