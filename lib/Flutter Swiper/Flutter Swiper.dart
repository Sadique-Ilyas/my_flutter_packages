import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterSwiper extends StatefulWidget {
  @override
  _FlutterSwiperState createState() => _FlutterSwiperState();
}

class _FlutterSwiperState extends State<FlutterSwiper> {

  List<String> images = ["assets/A.gif","assets/B.gif","assets/C.gif"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Swiper'),
      ),
      body: Swiper(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(80))),
            child: Image.asset(images[index]),
          );
        },
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
                .addRotate([-45/180, 0, 45/180])
                .addTranslate([
                  Offset(-370, -40),
                  Offset(0, 0),
                  Offset(370, -40),
        ]),
        loop: true,
        control: SwiperControl(),
        pagination: SwiperPagination(margin: EdgeInsets.only(bottom: 45)),
        itemHeight: 300,
        itemWidth: 300,
        onTap: (int index) {
          switch(index) {
            case 0: Fluttertoast.showToast(msg: "Apple");
                    break;
            case 1: Fluttertoast.showToast(msg: "Ball");
                    break;
            case 2: Fluttertoast.showToast(msg: "Cat");
                    break;
          }
        },
      ),
    );
  }
}
