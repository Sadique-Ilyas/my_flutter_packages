import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  @override
  _CachedNetworkImageWidgetState createState() =>
      _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cached Network Image'),
        ),
        body: Center(
          child: CachedNetworkImage(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/c/c8/Untersberg_Mountain_Salzburg_Austria_Landscape_Photography_%28256594075%29.jpeg",
            placeholder: (context, url) {
              return CircularProgressIndicator();
            },
            errorWidget: (context, url, error) {
              return Icon(Icons.error, color: Colors.red, size: 100);
            },
            fadeInCurve: Curves.bounceIn,
          ),
        ));
  }
}
