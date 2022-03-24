import 'dart:convert';

import 'package:awesome_weather/awesome_weather/domain/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class IWeatherDatasource {
  Future<WeatherModel> getWeather(String city);
}

class WeatherDatasource implements IWeatherDatasource {
  String apiId = 'bb289e839536c14ca6dbaa1dd68703e2';

  @override
  Future<WeatherModel> getWeather(String city) async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiId&units=metric');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        WeatherModel weatherInfo = WeatherModel.fromJson(result);

        return weatherInfo;
      }
    } catch (err) {
      throw err;
    }

    throw UnimplementedError();
  }
}
