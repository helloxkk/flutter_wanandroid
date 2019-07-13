import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_wanandroid/tools/screen.dart';
import 'package:flutter_wanandroid/entity/home_article_entity.dart';
import 'package:flutter_wanandroid/tools/request.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {

  List<HomeArticleDataData> dataList = [];

  @override
  void initState() {
    requestArticleList();
    super.initState();
  }

  void requestArticleList() async {
    var entity = await Request().get<HomeArticleEntity>("article/list/0/json");

    setState(() {
      this.dataList = entity.data.datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    var children = dataList
        .map((item) => IdeaListItem(
              entity: item,
            ))
        .toList();

    return Column(
      children: children,
    );
  }
}

class IdeaListItem extends StatelessWidget {
  final HomeArticleDataData entity;

  const IdeaListItem({Key key, this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: CachedNetworkImageProvider(entity.envelopePic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "12天前",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: Screen.width(context) * 0.8,
                      child: Text(
                        entity.title,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Image(
                      image: CachedNetworkImageProvider(entity.envelopePic),
                      width: 200.0,
                      height: 112.0,
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
