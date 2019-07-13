import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_wanandroid/tools/screen.dart';
import 'package:flutter_wanandroid/entity/home_article_entity.dart';
import 'package:flutter_wanandroid/tools/request.dart';

class DynamicList extends StatefulWidget {
  @override
  _DynamicListState createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
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
      padding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // 头像
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            "http://imgcache.qiongliao.net/app/avatar/2019/05/13/pm/230813/3f74a91e4750fc8a.png"),
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
                        ],
                      ),
                    )
                  ]),
              // 内容
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: CachedNetworkImageProvider(
                            "http://imgcache.qiongliao.net/app/servies/2019/07/09/am/230813/b96253eed4a3151d.jpg"),
                        width: 200.0,
                        height: 200.0,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              // 点赞、评论、分享
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        new Image.asset('resource/images/dontai_dianzan.png', height: 16),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: new Text('赞'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        new Image.asset('resource/images/dongtai_pinglun.png',
                            height: 16),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: Text('评论'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        new Image.asset('resource/images/dongtai_zhuanfa.png',
                            height: 16),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: Text('转发'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
            ]),
      ),
    );
  }
}
