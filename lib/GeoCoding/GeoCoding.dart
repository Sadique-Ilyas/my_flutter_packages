import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';


class GeoCodingWidget extends StatefulWidget {
  @override
  _GeoCodingWidgetState createState() => _GeoCodingWidgetState();
}

class _GeoCodingWidgetState extends State<GeoCodingWidget> {

  bool isShowing = false, next = false;
  List<Location> locations;
  List<Placemark> placemarks;

  @override
  void initState() {
    getLocationFromAddress();
    getPlacemarksFromCoordinates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeoCoding'),
        actions: [
          IconButton(icon: Icon(Icons.navigate_next), onPressed: () {
            setState(() {
              this.next = !this.next;
            });
          })
        ],
      ),
      body: isShowing ? ListView(
        children: next ? placemarks.map((location) {
          return ListTile(
            title: Text(location.toString()),
          );
        }).toList() : locations.map((location) {
          return ListTile(
            title: Text(location.toString()),
          );
        }).toList(),
      ) : Container()
    );
  }

  getLocationFromAddress() async {
    locations = await locationFromAddress("Gronausestraat 710, Enschede", localeIdentifier: 'en_IN');
    print(locations);
  }

  getPlacemarksFromCoordinates() async {
    placemarks = await placemarkFromCoordinates(52.216515699999995, 6.9459706);
    setState(() {
      this.isShowing = true;
    });
    print(placemarks);
  }
}
