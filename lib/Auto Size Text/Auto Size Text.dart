import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextWidget extends StatefulWidget {
  @override
  _AutoSizeTextWidgetState createState() => _AutoSizeTextWidgetState();
}

class _AutoSizeTextWidgetState extends State<AutoSizeTextWidget> {

  String text = "Android Studio 4.1 "
  "Build #AI-201.8743.12.41.6858069, built on September 23, 2020"
  "Runtime version: 1.8.0_242-release-1644-b01 amd64"
  "VM: OpenJDK 64-Bit Server VM by JetBrains s.r.o"
  "Windows 7 6.1"
  "GC: ParNew, ConcurrentMarkSweep"
  "Memory: 1246M"
  "Cores: 4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Size Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black, width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
                text,
                maxLines: 6,
                // overflowReplacement: Text('Sorry Text Overflowed'),
            ),
          ),
        ),
      ),
    );
  }
}
