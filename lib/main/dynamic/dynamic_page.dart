import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/main/dynamic/dynamic_list.dart';

class DynamicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DynamicPageState();
}

class DynamicPageState extends State<DynamicPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '关注'),
    Tab(text: '推荐'),
  ];

  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: myTabs,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return Stack(children: [
            RefreshIndicator(
              child: ListView(
                controller: _scrollController,
                children: <Widget>[DynamicList()],
              ),
              onRefresh: loadData,
            ),
          ]);
        }).toList(),
      ),
    );
  }
}

Future<void> loadData() async {

}
