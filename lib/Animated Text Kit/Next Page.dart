import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: WavyAnimatedTextKit(
          text: ['Awesome', 'Funny', 'Cool', 'Amazing'],
          textStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          speed: Duration(milliseconds: 500),
          onTap: () {
            Fluttertoast.showToast(msg: 'Clicked !');
          },
        )
      ),
    );
  }
}
