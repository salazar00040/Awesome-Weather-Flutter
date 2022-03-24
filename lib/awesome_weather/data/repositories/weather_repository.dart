import 'package:awesome_weather/awesome_weather/data/datasource/weather_datasource.dart';
import 'package:awesome_weather/awesome_weather/domain/interface_repositories/i_weather_repository.dart';
import 'package:awesome_weather/awesome_weather/domain/models/weather_model.dart';

class WeatherRepository implements IWeatherRepository {
  final IWeatherDatasource _dataSource;

  WeatherRepository(this._dataSource);

  @override
  Future<WeatherModel> getWeather(String city) async {
    return await this._dataSource.getWeather(city);
  }
}
