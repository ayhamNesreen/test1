import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/weather.dart';

class WeatherDetailScreen extends StatelessWidget {
  static const routeName = '/weather_detail_screen';
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments as int;
    final loadeddata = Provider.of<Weather>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: SingleChildScrollView(
        child: Container(
          width: deviceSize.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Card(
            elevation: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.date_range),
                      SizedBox(width: 10),
                      Text('${loadeddata.finalData[arg]['date']}',
                          style: TextStyle(fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 20),
                  detailsItem(
                      'Weather: ${loadeddata.finalData[arg]['weatherState']}'),
                  SizedBox(height: 20),
                  detailsItem(
                      'Weather Des: ${loadeddata.finalData[arg]['weatherDes']}'),
                  SizedBox(height: 20),
                  detailsItem(
                      'CloudState: ${loadeddata.finalData[arg]['cloudState']}'),
                  SizedBox(height: 20),
                  detailsItem(
                      'Wind Speed: ${loadeddata.finalData[arg]['windSpeed']}'),
                  SizedBox(height: 20),
                  detailsItem(
                      'Wind Deg: ${loadeddata.finalData[arg]['windDeg']}'),
                  SizedBox(height: 20),
                  detailsItem('Temp: ${loadeddata.finalData[arg]['temp']}'),
                  SizedBox(height: 20),
                  detailsItem(
                      'Max Temp: ${loadeddata.finalData[arg]['tempMax']}'),
                  SizedBox(height: 20),
                  detailsItem(
                      'Min Temp: ${loadeddata.finalData[arg]['tempMin']}'),
                  SizedBox(height: 20),
                  detailsItem(
                      'Humidity: ${loadeddata.finalData[arg]['humidity']}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailsItem(String data) {
    return Row(
      children: <Widget>[
        Text(
          data,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
