import 'package:awesome_weather/awesome_weather/domain/models/weather_model.dart';

abstract class IWeatherRepository {
  Future<WeatherModel> getWeather(String city);
}
