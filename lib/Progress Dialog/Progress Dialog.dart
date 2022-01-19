import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProgressDialogWidget extends StatefulWidget {
  @override
  _ProgressDialogWidgetState createState() => _ProgressDialogWidgetState();
}

class _ProgressDialogWidgetState extends State<ProgressDialogWidget> {
  ProgressDialog progressDialog;
  String downloadMessage = "Downloading...";
  var progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Dialog'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              progressDialog = ProgressDialog(context,
                  type: ProgressDialogType.Normal, isDismissible: true);
              progressDialog.show();
            },
            label: Text('Progress Dialog (Normal)'),
            icon: Icon(Icons.file_download),
            heroTag: null,
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              progressDialog = ProgressDialog(context,
                  type: ProgressDialogType.Download, isDismissible: true);
              progressDialog.show();
              Future.delayed(Duration(seconds: 1)).then((value) {
                progress = progress + 10;
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 2)).then((value) {
                progress = progress + 10;
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 3)).then((value) {
                progress = progress + 10;
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 4)).then((value) {
                progress = progress + 10;
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 5)).then((value) {
                progress = progress + 10;
                downloadMessage = 'Half Finished...';
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 6)).then((value) {
                progress = progress + 10;
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 7)).then((value) {
                progress = progress + 10;
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 8)).then((value) {
                progress = progress + 10;
                downloadMessage = 'Almost Done...';
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 9)).then((value) {
                progress = progress + 10;
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
              Future.delayed(Duration(seconds: 10)).then((value) {
                progress = progress + 10;
                downloadMessage = 'Download Complete.';
                progressDialog.update(
                    message: downloadMessage, progress: progress);
              });
            },
            label: Text('Progress Dialog (Download)'),
            icon: Icon(Icons.file_download),
            heroTag: null,
          ),
        ],
      )),
    );
  }
}
