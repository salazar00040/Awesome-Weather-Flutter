import 'package:awesome_weather/awesome_weather/domain/models/weather_model.dart';
import 'package:awesome_weather/awesome_weather/domain/usecases/weather_use_case.dart';
import 'package:awesome_weather/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'weather_home_page_store.g.dart';

class WeatherHomePageStore = _WeatherHomePageStore with _$WeatherHomePageStore;

abstract class _WeatherHomePageStore with Store {
  final IWeatherUseCase _weatherUseCase = serviceLocator<IWeatherUseCase>();
  final TextEditingController cityController = TextEditingController();

  _WeatherHomePageStore() {
    buildDaysThatWillBeShow();
  }

  final _weatherIconList = [
    'https://bmcdn.nl/assets/weather-icons/v2.1/fill/thunderstorms-rain.svg', //thunderstorm
    'https://assets9.lottiefiles.com/temp/lf20_rpC1Rd.json', //rain
    'https://assets9.lottiefiles.com/temp/lf20_BSVgyt.json', //snow
    'https://assets9.lottiefiles.com/temp/lf20_HflU56.json', //many circumstance
    'https://assets9.lottiefiles.com/temp/lf20_Stdaec.json', //clear
    'https://assets9.lottiefiles.com/temp/lf20_dgjK9i.json', //Cloudy
  ];

  final List<String> daysOfTheWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @observable
  List<String> dayThatWillBeShow = [];

  var weatherIcon = '';

  @observable
  var weather = WeatherModel(
    id: 0,
    description: '',
    country: '',
    name: '',
    speed: 0,
    temp: 0,
    humidity: 0,
  );

  @observable
  bool hasError = false;

  @observable
  String errorMsg = '';

  @observable
  int icon = 0;

  @observable
  bool isLoading = false;

  @action
  Future getWeather(String city) async {
    hasError = false;
    isLoading = true;

    final String city = cityController.text;

    try {
      var _weatherInfo = await _weatherUseCase.getWeather(city);
      weather = _weatherInfo;

      fetchWeatherIcon();
      isLoading = false;
    } catch (err) {
      hasError = true;
      if (err is UnimplementedError) {
        errorMsg = 'No city found! Try correcting the name of the city.';
      } else {
        errorMsg = 'Unknown Error';
      }
    }
  }

  buildDaysThatWillBeShow() {
    var day = DateTime.now().weekday;
    var aux = [...daysOfTheWeek, ...daysOfTheWeek];

    dayThatWillBeShow.clear();

    for (int i = day - 1; i < (day - 1) + 5; i++) {
      dayThatWillBeShow.add(aux[i]);
    }
  }

  Future fetchWeatherIcon() async {
    var weatherId = await weather.id;
    if (weatherId < 299) {
      weatherIcon = _weatherIconList[0];
    } else if (weatherId < 532) {
      weatherIcon = _weatherIconList[1];
    } else if (weatherId < 622) {
      weatherIcon = _weatherIconList[2];
    } else if (weatherId < 781) {
      weatherIcon = _weatherIconList[3];
    } else if (weatherId == 800) {
      weatherIcon = _weatherIconList[4];
    } else if (weatherId > 800) {
      weatherIcon = _weatherIconList[5];
    }
  }
}
