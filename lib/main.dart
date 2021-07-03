import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './provider/weather.dart';

import 'screens/my_home_page.dart';

import 'screens/weather_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Weather>.value(
      value: Weather(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(44, 50, 76, 1),
          accentColor: Color.fromRGBO(201, 167, 45, 1),
        ),
        home: MyHomePage(),
        routes: {
          WeatherDetailScreen.routeName: (ctx) => WeatherDetailScreen(),
        },
      ),
    );
  }
}
