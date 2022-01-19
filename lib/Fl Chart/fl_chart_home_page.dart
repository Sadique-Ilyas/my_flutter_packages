import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_packages/Fl%20Chart/bar_chart/bar_chart_sample1/bar_chart_widget.dart';
import 'package:my_flutter_packages/Fl%20Chart/bar_chart/bar_chart_sample2/bar_chart_widget2.dart';
import 'package:my_flutter_packages/Fl%20Chart/bar_chart/bar_chart_sample3/bar_chart_widget3.dart';
import 'package:my_flutter_packages/Fl%20Chart/line_chart/line_chart_sample1/line_chart_widget.dart';
import 'package:my_flutter_packages/Fl%20Chart/line_chart/line_chart_sample2/line_chart_widget2.dart';
import 'package:my_flutter_packages/Fl%20Chart/pie_chart/pie_chart_sample1/pie_chart_widget1.dart';
import 'package:my_flutter_packages/Fl%20Chart/pie_chart/pie_chart_sample2/pie_chart_widget2.dart';

class FlChartHomePage extends StatefulWidget {
  @override
  _FlChartHomePageState createState() => _FlChartHomePageState();
}

class _FlChartHomePageState extends State<FlChartHomePage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        LineChartWidget(),
        LineChartSample1(),
        BarChartSample1(),
        BarChartSample2(),
        BarChartSample3(),
        PieChartSample2(),
        PieChartSample3()
      ],
    );
  }
}
