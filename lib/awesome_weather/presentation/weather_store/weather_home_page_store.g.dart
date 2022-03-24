// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherHomePageStore on _WeatherHomePageStore, Store {
  final _$dayThatWillBeShowAtom =
      Atom(name: '_WeatherHomePageStore.dayThatWillBeShow');

  @override
  List<String> get dayThatWillBeShow {
    _$dayThatWillBeShowAtom.reportRead();
    return super.dayThatWillBeShow;
  }

  @override
  set dayThatWillBeShow(List<String> value) {
    _$dayThatWillBeShowAtom.reportWrite(value, super.dayThatWillBeShow, () {
      super.dayThatWillBeShow = value;
    });
  }

  final _$weatherAtom = Atom(name: '_WeatherHomePageStore.weather');

  @override
  WeatherModel get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(WeatherModel value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_WeatherHomePageStore.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_WeatherHomePageStore.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  final _$iconAtom = Atom(name: '_WeatherHomePageStore.icon');

  @override
  int get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(int value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_WeatherHomePageStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getWeatherAsyncAction =
      AsyncAction('_WeatherHomePageStore.getWeather');

  @override
  Future<dynamic> getWeather(String city) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(city));
  }

  @override
  String toString() {
    return '''
dayThatWillBeShow: ${dayThatWillBeShow},
weather: ${weather},
hasError: ${hasError},
errorMsg: ${errorMsg},
icon: ${icon},
isLoading: ${isLoading}
    ''';
  }
}
