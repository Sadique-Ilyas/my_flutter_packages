import 'package:flutter/material.dart';

class CountryCodePickerWidget extends StatefulWidget {
  @override
  _CountryCodePickerWidgetState createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Code Picker'),
      ),
    );
  }
}
