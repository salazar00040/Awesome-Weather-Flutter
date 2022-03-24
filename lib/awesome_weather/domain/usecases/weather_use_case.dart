import 'package:awesome_weather/awesome_weather/domain/interface_repositories/i_weather_repository.dart';
import 'package:awesome_weather/awesome_weather/domain/models/weather_model.dart';

abstract class IWeatherUseCase {
  Future<WeatherModel> getWeather(String city);
}

class WeatherUseCase implements IWeatherUseCase {
  final IWeatherRepository _repository;

  WeatherUseCase(this._repository);

  @override
  Future<WeatherModel> getWeather(String city) async {
    try {
      final result = await _repository.getWeather(city);
      return result;
    } catch (err) {
      throw err;
    }
  }
}
