import 'package:flutter/material.dart';
import 'package:my_flutter_packages/Animated%20Splash%20Screen/Splash%20Screen.dart';
import 'package:my_flutter_packages/Animated%20Text%20Kit/Animated%20Text%20Kit.dart';
import 'package:my_flutter_packages/Cached%20Network%20Image/Cached%20Network%20Image.dart';
import 'package:my_flutter_packages/Country%20Code%20Picker/Country%20Code%20Picker.dart';
import 'package:my_flutter_packages/Dio/Dio.dart';
import 'package:my_flutter_packages/Dynamic%20Theme/Dynamic%20Theme.dart';
import 'package:my_flutter_packages/Fl%20Chart/fl_chart_home_page.dart';
import 'package:my_flutter_packages/Flutter%20SpinKit/Flutter%20SpinKit.dart';
import 'package:my_flutter_packages/Flutter%20Swiper/Flutter%20Swiper.dart';
import 'package:my_flutter_packages/Flutter%20Toast/Flutter%20Toast.dart';
import 'package:my_flutter_packages/GeoCoding/GeoCoding.dart';
import 'package:my_flutter_packages/Giffy%20Dialog/Giffy%20Dialog.dart';
import 'package:my_flutter_packages/Location/Location.dart';
import 'package:my_flutter_packages/Progress%20Dialog/Progress%20Dialog.dart';
import 'Goelocator/Geolocator.dart';
import 'Auto Size Text/Auto Size Text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Packages',
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

List<String> items = [
  'Animated Splash Screen',
  'Flutter Swiper',
  'Flutter Toast',
  'Giffy Dialog',
  'Cached Network Image',
  'Flutter SpinKit',
  'Animated Text Kit',
  'Progress Dialog',
  'Auto Size Text',
  'Dio',
  'Location',
  'GeoLocator',
  'GeoCoding',
  'Fl Chart',
  'Dynamic Theme',
  'Country Code Picker'
];

List<String> recentListItems = [];

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Packages'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: ListSearch());
                })
          ],
        ),
        body: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(items[index]),
                onTap: () {
                  nextRoute(context, items[index]);
                  if (!recentListItems.contains(items[index])) {
                    recentListItems.add(items[index]);
                  }
                  if (recentListItems.length > 5) {
                    recentListItems.removeAt(0);
                  }
                });
          },
        ));
  }
}

class ListSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app Bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show results once selected
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show Suggestions
    final suggestionsList = query.isEmpty
        ? recentListItems
        : items
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
            text: TextSpan(
                text: suggestionsList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionsList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          ),
          onTap: () {
            nextRoute(context, suggestionsList[index]);
          },
        );
      },
      itemCount: suggestionsList.length,
    );
  }
}

void nextRoute(BuildContext context, String item) {
  switch (item) {
    case 'Animated Splash Screen':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
      break;
    case 'Flutter Swiper':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FlutterSwiper()));
      break;
    case 'Flutter Toast':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FlutterToast()));
      break;
    case 'Giffy Dialog':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GiffyDialog()));
      break;
    case 'Cached Network Image':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CachedNetworkImageWidget()));
      break;
    case 'Flutter SpinKit':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FlutterSpinKit()));
      break;
    case 'Animated Text Kit':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AnimatedTextKit()));
      break;
    case 'Progress Dialog':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProgressDialogWidget()));
      break;
    case 'Auto Size Text':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AutoSizeTextWidget()));
      break;
    case 'Dio':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DioWidget()));
      break;
    case 'Location':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyLocationWidget()));
      break;
    case 'GeoLocator':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GeoLocatorWidget()));
      break;
    case 'GeoCoding':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GeoCodingWidget()));
      break;
    case 'Fl Chart':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FlChartHomePage()));
      break;
    case 'Dynamic Theme':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DynamicThemeHomePage()));
      break;
    case 'Country Code Picker':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CountryCodePickerWidget()));
      break;      
  }
}
