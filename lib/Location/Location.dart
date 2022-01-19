import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MyLocationWidget extends StatefulWidget {
  @override
  _MyLocationWidgetState createState() => _MyLocationWidgetState();
}

class _MyLocationWidgetState extends State<MyLocationWidget> {

  var time, accuracy, altitude, heading, latitude, longitude, speed, speedAccuracy;
  
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  void dispose() {
    getLocation();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Time: $time', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Accuracy: $accuracy', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Altitude: $altitude', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Heading: $heading', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Latitude: $latitude', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Longitude: $longitude', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Speed: $speed', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Speed Accuracy: $speedAccuracy', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  getLocation () async {
    Location location = new Location();
    
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    location.changeSettings(accuracy: LocationAccuracy.high);

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      setState(() {
        time = DateTime.fromMicrosecondsSinceEpoch(currentLocation.time.toInt()).minute;
        accuracy = currentLocation.accuracy;
        altitude = currentLocation.altitude;
        heading = currentLocation.heading;
        latitude = currentLocation.latitude;
        longitude = currentLocation.longitude;
        speed = currentLocation.speed;
        speedAccuracy = currentLocation.speedAccuracy;
      });
    });
  }
}
