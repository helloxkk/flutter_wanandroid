import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/main/homepage/home_header.dart';
import 'package:flutter_wanandroid/main/homepage/home_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  List<String> dataList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: appBarLabel(),
        actions: searchAction(),
      ),
      body: Stack(children: [
        RefreshIndicator(
          child: ListView(
            controller: scrollController,
            children: <Widget>[SwiperView(), HomeList()],
          ),
          onRefresh: loadData,
        ),
      ]),
    );
  }

  Future<void> loadData() async {

  }

  // appLabel
  appBarLabel() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new FlutterLogo(
          size: 30,
          colors: Colors.teal,
          style: FlutterLogoStyle.markOnly,
          duration: new Duration(
            // 当c olors、textColor 或者 style 变化的时候起作用
            seconds: 3,
          ),
          curve: Curves.bounceIn, // 动画方式
        ),
        new Image.asset('resource/images/logo.png', height: 35.0),
      ],
    );
  }

  flutterLogo() {
    return new FlutterLogo(
      size: 30,
      colors: Colors.teal,
      style: FlutterLogoStyle.markOnly,
      duration: new Duration(
        // 当c olors、textColor 或者 style 变化的时候起作用
        seconds: 3,
      ),
      curve: Curves.bounceIn, // 动画方式
    );
  }

  // 搜索图标
  searchAction() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        tooltip: "Search",
        onPressed: () async {
          final snackBar = new SnackBar(
            content: new Text('搜索'),
            backgroundColor: Colors.grey,
            duration: Duration(seconds: 2), // 持续时间
            //animation,
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
      )
    ];
  }
}
