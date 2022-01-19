import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorWidget extends StatefulWidget {
  @override
  _GeoLocatorWidgetState createState() => _GeoLocatorWidgetState();
}

class _GeoLocatorWidgetState extends State<GeoLocatorWidget> {

  var accuracy, altitude, heading, latitude, longitude, speed, speedAccuracy, distance, bearing;

  @override
  void initState() {
    determinePosition();
    super.initState();
  }

  @override
  void dispose() {
    determinePosition();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeoLocator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Accuracy: $accuracy', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Altitude: $altitude', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Heading: $heading', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Latitude: $latitude', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Longitude: $longitude', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Speed: $speed', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Speed Accuracy: $speedAccuracy', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Distance: $distance metres', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Bearing: $bearing degrees', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.bestForNavigation).listen(
            (Position position) {
              setState(() {
                longitude = position.longitude;
                latitude = position.latitude;
                speed = position.speed;
                speedAccuracy = position.speedAccuracy;
                accuracy = position.accuracy;
                heading = position.heading;
                altitude = position.altitude;
              });
        });
    
    setState(() {
      distance = Geolocator.distanceBetween(27.21615, 75.70006, 26.9124, 75.7873).roundToDouble();
    });

    setState(() {
      bearing = Geolocator.bearingBetween(27.21615, 75.70006, 26.9124, 75.7873).roundToDouble();
    });
  }
}
