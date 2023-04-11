import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = 'ec8c320e864a75fcc69da9ef1b016baa';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    double temperature = weatherData['main']['temp'];
    int weatherId = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];

    print(temperature);
    print(weatherId);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
