import 'package:awesome_weather/awesome_weather/data/datasource/weather_datasource.dart';
import 'package:awesome_weather/awesome_weather/data/repositories/weather_repository.dart';
import 'package:awesome_weather/awesome_weather/domain/interface_repositories/i_weather_repository.dart';
import 'package:awesome_weather/awesome_weather/domain/usecases/weather_use_case.dart';
import 'package:awesome_weather/core/service_locator.dart';

Future<void> weatherRegisterLocators() async {
  //Datasource
  serviceLocator.registerLazySingleton<IWeatherDatasource>(() => WeatherDatasource());

  //Repositories
  serviceLocator.registerLazySingleton<IWeatherRepository>(
    () => WeatherRepository(serviceLocator<IWeatherDatasource>()),
  );

  //UseCase
  serviceLocator.registerLazySingleton<IWeatherUseCase>(
    () => WeatherUseCase(serviceLocator<IWeatherRepository>()),
  );
}
