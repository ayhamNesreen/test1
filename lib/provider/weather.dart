import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class Weather with ChangeNotifier {
  List<Map<String, dynamic>> _finalData = [];

  List<Map<String, dynamic>> get finalData {
    return [..._finalData];
  }

  List<String> t = [];

  var date,
      weatherData,
      weatherState,
      weatherDes,
      windData,
      windDeg,
      windSpeed,
      cloudsData,
      cloudState,
      tempData,
      temp,
      tempMax,
      tempMin,
      humidity;

  Future<void> getData() async {
    final url =
        'http://api.openweathermap.org/data/2.5/forecast?id=292223&appid=e46beabf6a0818663c9ac849e9476b7f';
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>;
    final extractedData = data['list'] as List<dynamic>;

    int i = 0;
    extractedData.forEach((item) {
      date = extractedData[i]['dt_txt'] as String;
      t = (date.split(' '));
      date = t[0];
      weatherData = extractedData[i]['weather'][0];
      weatherState = weatherData['main'];
      weatherDes = weatherData['description'];
      cloudsData = extractedData[i]['clouds'];
      cloudState = cloudsData['all'];
      windData = extractedData[i]['wind'];
      windSpeed = windData['speed'];
      windDeg = windData['deg'];
      tempData = extractedData[i]['main'];
      temp = tempData['temp'];
      tempMax = tempData['temp_max'];
      tempMin = tempData['temp_min'];
      humidity = tempData['humidity'];
      _finalData.add({
        'date': date,
        'weatherState': weatherState,
        'weatherDes': weatherDes,
        'cloudState': cloudState,
        'windSpeed': windSpeed,
        'windDeg': windDeg,
        'temp': temp,
        'tempMax': tempMax,
        'tempMin': tempMin,
        'humidity': humidity,
      });
      i = i + 7;
    });
    notifyListeners();
  }
}
