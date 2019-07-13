import 'package:flutter_wanandroid/entity/home_project_list_entity.dart';
import 'package:flutter_wanandroid/entity/home_banner_entity.dart';
import 'package:flutter_wanandroid/entity/home_article_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeProjectListEntity") {
      return HomeProjectListEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeBannerEntity") {
      return HomeBannerEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeArticleEntity") {
      return HomeArticleEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}