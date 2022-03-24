import 'package:awesome_weather/awesome_weather/presentation/weather_store/weather_home_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class AwesomeWeather extends StatefulWidget {
  @override
  _AwesomeWeatherState createState() => _AwesomeWeatherState();
}

class _AwesomeWeatherState extends State<AwesomeWeather> {
  final WeatherHomePageStore _weatherHomePageStore = WeatherHomePageStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _CustomAppBar(),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade600, Colors.blue.shade900],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.yellowAccent.shade100,
                  alignment: Alignment.center,
                  child: Observer(
                    builder: (_) => Visibility(
                      visible: _weatherHomePageStore.hasError == true,
                      child: Text(
                        '${_weatherHomePageStore.errorMsg}',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      replacement: Container(),
                    ),
                  ),
                ),
                SizedBox(height: 75),
                Container(
                  child: Observer(
                    builder: (context) {
                      return Text(
                        '${_weatherHomePageStore.weather.name}',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.30),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 0.5),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Observer(
                  builder: (context) {
                    return _weatherHomePageStore.isLoading
                        ? SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : LottieBuilder.network(
                            _weatherHomePageStore.weatherIcon,
                            fit: BoxFit.cover,
                            width: 80,
                            errorBuilder: (_, __, ___) {
                              return CircularProgressIndicator(
                                color: Colors.white,
                              );
                            },
                          );
                  },
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: Observer(builder: (_) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            '${_weatherHomePageStore.weather.description.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '${_weatherHomePageStore.weather.temp.toInt()}º',
                          style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(
                  height: 15,
                ),
                Observer(builder: (context) {
                  return weatherInformation();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget weatherInformation() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
      padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        border: Border.all(
          color: Color(0xffB2C9DD),
          width: 2,
        ),
        color: Color(0xffFFFFFF).withOpacity(0.30),
      ),
      child: Column(
        children: [
          // Weather Detail
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(height: 13),
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(height: 13),
                    Icon(
                      Icons.air,
                      color: Colors.white,
                    ),
                    SizedBox(height: 13),
                    Icon(
                      Icons.water_damage_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(width: 20),
                // Type
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'City',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Wind',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Humidity',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                // Divider
                Column(
                  children: [
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                // Number
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_weatherHomePageStore.weather.country}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      '${_weatherHomePageStore.weather.name}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      '${_weatherHomePageStore.weather.speed} km/h',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      '${_weatherHomePageStore.weather.humidity} %',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final WeatherHomePageStore _weatherHomePageStore = WeatherHomePageStore();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Observer(builder: (context) {
          return TextField(
            keyboardType: TextInputType.text,
            controller: _weatherHomePageStore.cityController,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _weatherHomePageStore
                      .getWeather(_weatherHomePageStore.cityController.text);
                  _weatherHomePageStore.cityController.clear();
                  FocusScope.of(context).unfocus();
                },
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _weatherHomePageStore.cityController.clear();
                },
              ),
              hintText: 'Search city...',
              border: InputBorder.none,
            ),
          );
        }),
      ),
    );
  }
}
