import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getWeather() async {
    var data = await WeatherModel().getLocationWeather();
    if (data != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(locationWeather: data)));
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitRing(
        color: Colors.white,
        size: 100.0,
      ),
    ));
  }
}
