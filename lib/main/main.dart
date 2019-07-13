import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/main/homepage/home_page.dart';
import 'package:flutter_wanandroid/main/FourthPage.dart';
import 'package:flutter_wanandroid/main/dynamic/dynamic_page.dart';
import 'package:flutter_wanandroid/main/ThirdPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
        print(_currentIndex);
      });
    }
  }

  final List<Widget> _children = [HomePage(), DynamicPage(), ThirdPage(), FourthPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
        iconSize: 24.0,
        // BottomNavigationBarItem 中 icon 的大小
        currentIndex: _currentIndex,
        // 当前所高亮的按钮index
        onTap: _onItemTapped,
        // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Message"), icon: Icon(Icons.message)),
//          BottomNavigationBarItem(title: Text(""), icon: Icon(null)),
          BottomNavigationBarItem(title: Text("menu"), icon: Icon(Icons.menu)),
          BottomNavigationBarItem(
              title: Text("other"), icon: Icon(Icons.devices_other)),
        ],
      ),
    );
  }
}
