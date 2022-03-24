import 'package:awesome_weather/awesome_weather/register_service_locator/weather_register_service_locator.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  weatherRegisterLocators();
}
