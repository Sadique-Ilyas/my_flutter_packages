import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DioWidget extends StatefulWidget {
  @override
  _DioWidgetState createState() => _DioWidgetState();
}

class _DioWidgetState extends State<DioWidget> {
  String downloadMessage = "Start Download...";
  String urlPath =
      "https://wallpapercart.com/wp-content/uploads/2019/03/paris-hd-wallpapers-1080p.jpg";
  bool isDownloading = false;
  double _percentage = 0;
  double percentage = 0;
  String imageDir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                downloadMessage,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: _percentage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  downloadTask();
                },
                label: Text('Download'),
                icon: Icon(Icons.file_download),
              ),
            )
          ],
        ),
      ),
    );
  }

  void downloadTask() async {
    var dir = await getExternalStorageDirectory();

    Dio dio = Dio();
    dio.download(urlPath, "${dir.path}/sample.jpg",
        onReceiveProgress: (actualBytes, totalBytes) {
      setState(() {
        if (totalBytes != -1) {
          if (actualBytes != totalBytes) {
            percentage = (actualBytes / totalBytes) * 100;
            _percentage = percentage / 100;
            print("-----------------------");
            print("-----------------------");
            print("$actualBytes / $totalBytes");
            print(_percentage);
            print("-----------------------");
            print("-----------------------");
            downloadMessage =
                "Downloading: ${(percentage).toStringAsFixed(1)} %\n${(actualBytes / 1000000).toStringAsFixed(2)} MB / ${(totalBytes / 1000000).toStringAsFixed(2)} MB";
          } else {
            downloadMessage =
                "Download Complete: 100.0 %\n${(actualBytes / 1000000).toStringAsFixed(2)} MB / ${(totalBytes / 1000000).toStringAsFixed(2)} MB";
            _percentage = 1;
            print("--------------------------");
            print("--------------------------");
            print("${dir.path}/sample.jpg");
            print("--------------------------");
            print("--------------------------");
          }
        } else {
          downloadMessage =
              "Downloading: ${(percentage).toStringAsFixed(1)} %\n${(actualBytes / 1000000).toStringAsFixed(2)} MB / 0 MB";
          _percentage = null;
        }
      });
    });
  }
}
