
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/services/weather_services.dart';


class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0097b2),
        title: Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (data)
                {
                  cityName = data;
                },
                onSubmitted: (data) async {
                  cityName = data;

                  WeatherService service = WeatherService();

                  WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  label: Text('  search'),
                  labelStyle:TextStyle(color: Color(0xFF0097b2)) ,
                  suffixIcon: GestureDetector(

                      onTap : () async
                      {
                        WeatherService service = WeatherService();

                        WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);

                        Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                        Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.search, color: Colors.black,)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(46)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF000000),),
                      borderRadius: BorderRadius.circular(46)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0097b2),width: 2),
                      borderRadius: BorderRadius.circular(46)),
                  hintText: 'Enter a city',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
