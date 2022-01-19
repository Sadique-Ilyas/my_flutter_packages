import 'package:flutter/material.dart';

class DynamicThemeHomePage extends StatefulWidget {
  @override
  _DynamicThemeHomePageState createState() => _DynamicThemeHomePageState();
}

class _DynamicThemeHomePageState extends State<DynamicThemeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Theme'),
      ),
    );
  }
}
