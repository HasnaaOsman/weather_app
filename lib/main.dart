import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/homeview.dart';
import 'package:weather/pages/splash.dart';
import 'package:weather/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()  ,
      ),
      home: Splash(),
    );
  }
}