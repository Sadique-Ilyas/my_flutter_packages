import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_packages/Fl%20Chart/line_chart/line_chart_sample1/line_titles.dart';

class LineChartWidget extends StatefulWidget {
  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart Sample 1'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(right: 15),
        width: double.infinity,
        child: LineChart(
          showAvg ? LineTitles().avgData() : LineTitles().mainData(),
        ),
      ),
    );
  }
}
