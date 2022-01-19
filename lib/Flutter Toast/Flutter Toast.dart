import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast extends StatefulWidget {
  @override
  _FlutterToastState createState() => _FlutterToastState();
}

class _FlutterToastState extends State<FlutterToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Toast'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blueAccent,
          child: Text(
            'SHOW TOAST',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Fluttertoast.showToast(
              msg: 'This is a Toast',
              fontSize: 25,
              textColor: Colors.deepPurple,
              backgroundColor: Colors.green,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          },
        ),
      ),
    );
  }
}
