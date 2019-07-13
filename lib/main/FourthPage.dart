import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FourthPageState();
}

class FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FourthPage"),
      ),
      body: new Center(
        child: new Text("我是第四页"),
      ),
    );
  }
}