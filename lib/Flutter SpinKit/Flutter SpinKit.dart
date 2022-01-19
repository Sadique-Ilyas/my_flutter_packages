import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FlutterSpinKit extends StatefulWidget {
  @override
  _FlutterSpinKitState createState() => _FlutterSpinKitState();
}

class _FlutterSpinKitState extends State<FlutterSpinKit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SpinKit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitCircle(color: Colors.red, size: 80,),
                  SpinKitChasingDots(color: Colors.red, size: 80,),
                  SpinKitCubeGrid(color: Colors.red, size: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitDoubleBounce(color: Colors.red, size: 80,),
                  SpinKitDualRing(color: Colors.red, size: 80,),
                  SpinKitFadingCube(color: Colors.red, size: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitFadingCircle(color: Colors.red, size: 80,),
                  SpinKitFadingFour(color: Colors.red, size: 80,),
                  SpinKitFadingGrid(color: Colors.red, size: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitFoldingCube(color: Colors.red, size: 80,),
                  SpinKitHourGlass(color: Colors.red, size: 80,),
                  SpinKitPouringHourglass(color: Colors.red, size: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitPulse(color: Colors.red, size: 80,),
                  SpinKitPumpingHeart(color: Colors.red, size: 80,),
                  SpinKitRing(color: Colors.red, size: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitRipple(color: Colors.red, size: 80,),
                  SpinKitRotatingCircle(color: Colors.red, size: 80,),
                  SpinKitRotatingPlain(color: Colors.red, size: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitSpinningCircle(color: Colors.red, size: 80,),
                  SpinKitThreeBounce(color: Colors.red, size: 80,),
                  SpinKitWanderingCubes(color: Colors.red, size: 80,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitWave(color: Colors.red, size: 80,),
                  SpinKitWave(
                    size: 80,
                    type: SpinKitWaveType.center,
                    itemBuilder: (context, index) {
                      return DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index.isEven ? Colors.green : Colors.red
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
