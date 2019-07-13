import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  // 声明一个list，存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
      ..add(Image.network(
        'https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://wanandroid.com/blogimgs/c3615a24-79ef-45c9-9ae6-5adfe5437d32.jpeg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://www.wanandroid.com/blogimgs/00f83f1d-3c50-439f-b705-54a49fc3d90d.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: 180,
        margin: EdgeInsets.only(top: 10),
        child: new Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: imageList.length,
          viewportFraction: 0.8,
          scale: 0.9,
          itemHeight: 180,
          itemWidth: screenWidth,
          layout: SwiperLayout.DEFAULT,
          autoplay: true,
          autoplayDelay: 5000,
        ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}
