import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/weather.dart';

import '../screens/weather_detail_screen.dart';

class Item extends StatelessWidget {
  
  final index;
  Item(this.index);

  @override
  Widget build(BuildContext context) {
    final loadeddata = Provider.of<Weather>(context, listen: false);

    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(WeatherDetailScreen.routeName, arguments: index),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(loadeddata.finalData[index]['date'],
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('Weather: ${loadeddata.finalData[index]['weatherState']}',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 6),
              Text('Temp: ${loadeddata.finalData[index]['temp']}',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
