import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_packages/Animated%20Text%20Kit/Next%20Page.dart';

class AnimatedTextKit extends StatefulWidget {
  @override
  _AnimatedTextKitState createState() => _AnimatedTextKitState();
}

class _AnimatedTextKitState extends State<AnimatedTextKit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Text Kit'),
        actions: [
          FlatButton(
            child: Text(
              'Next Page',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NextPage()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Fade',
                      style: TextStyle(fontSize: 15),
                    ),
                    FadeAnimatedTextKit(
                      text: ['Awesome', 'Funny', 'Cool', 'Amazing'],
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      alignment: AlignmentDirectional.center,
                      repeatForever: true,
                      onTap: () {
                        Fluttertoast.showToast(msg: 'Clicked !');
                      },
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Colorize',
                      style: TextStyle(fontSize: 15),
                    ),
                    ColorizeAnimatedTextKit(
                      text: ['Awesome', 'Funny', 'Cool', 'Amazing'],
                      colors: [
                        Colors.red,
                        Colors.green,
                        Colors.yellow,
                        Colors.purpleAccent,
                        Colors.orange
                      ],
                      speed: Duration(milliseconds: 500),
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      alignment: AlignmentDirectional.center,
                      repeatForever: true,
                      onTap: () {
                        Fluttertoast.showToast(msg: 'Clicked !');
                      },
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Rotate',
                      style: TextStyle(fontSize: 15),
                    ),
                    RotateAnimatedTextKit(
                      text: ['Awesome', 'Funny', 'Cool', 'Amazing'],
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      alignment: AlignmentDirectional.center,
                      repeatForever: true,
                      onTap: () {
                        Fluttertoast.showToast(msg: 'Clicked !');
                      },
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Scale',
                      style: TextStyle(fontSize: 15),
                    ),
                    ScaleAnimatedTextKit(
                      text: ['Awesome', 'Funny', 'Cool', 'Amazing'],
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      alignment: AlignmentDirectional.center,
                      repeatForever: true,
                      onTap: () {
                        Fluttertoast.showToast(msg: 'Clicked !');
                      },
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
