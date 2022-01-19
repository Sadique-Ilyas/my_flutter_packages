import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(child: Text('WELCOME', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)),
    );
  }
}
