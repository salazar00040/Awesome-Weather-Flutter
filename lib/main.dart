import 'package:awesome_weather/core/service_locator.dart';
import 'package:flutter/material.dart';

import 'awesome_weather/presentation/weather_page/weather_home_page.dart';

void main() async {
  await setupLocator();
  runApp(
    AwesomeWeather(),
  );
}
