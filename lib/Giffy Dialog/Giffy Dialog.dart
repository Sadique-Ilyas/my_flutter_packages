import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class GiffyDialog extends StatefulWidget {
  @override
  _GiffyDialogState createState() => _GiffyDialogState();
}

class _GiffyDialogState extends State<GiffyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giffy Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Asset Giffy Dialog'),
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return showAssetGiffyDialog();
                });
              },
            ),
            RaisedButton(
              child: Text('Network Giffy Dialog'),
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return showNetworkGiffyDialog();
                });
              },
            ),
          ],
        ),
      )
    );
  }

  showAssetGiffyDialog() {
    return AssetGiffyDialog(
        image: Image.asset("assets/avengers.gif", fit: BoxFit.fill,),
        title: Text('Avengers Dancing Gif', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        description: Text('This is a Avengers Dancing Gif. This is a just a demo to use GiffyDialog.',
          textAlign: TextAlign.center,
        ),
      cornerRadius: 20,
      entryAnimation: EntryAnimation.BOTTOM,
      buttonRadius: 20,
      buttonCancelColor: Colors.red,
      buttonOkColor: Colors.green,
      onOkButtonPressed: () {Fluttertoast.showToast(msg: 'OK Button Tapped !');},
    );
  }

  showNetworkGiffyDialog() {
    return NetworkGiffyDialog(
        image: Image.network("https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif", fit: BoxFit.fill,),
      title: Text('Granny Eating Chocolate',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600)),
      description:Text('This is a granny eating chocolate dialog box. This library helps you easily create fancy giffy dialog',
        textAlign: TextAlign.center,
      ),
      cornerRadius: 20,
      entryAnimation: EntryAnimation.BOTTOM,
      buttonRadius: 20,
      buttonCancelColor: Colors.red,
      buttonOkColor: Colors.green,
      onOkButtonPressed: () {Fluttertoast.showToast(msg: 'OK Button Tapped !');},
    );
  }
}