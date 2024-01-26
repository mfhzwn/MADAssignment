import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lab12/screens/home_screen_widgets.dart';
import '../bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenWidgets homeScreenWidgets = HomeScreenWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 40),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                homeScreenWidgets.drawPurpleCircle(3, -0.3),
                homeScreenWidgets.drawPurpleCircle(-3, -0.3),
                homeScreenWidgets.drawOrangeSquare(0, -1.2),
                homeScreenWidgets.produceGradientColor(100.0, 100.0),
                displayWeatherInformation(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displayWeatherInformation(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homeScreenWidgets.displayCurrentLocation(state.weather.areaName),
                homeScreenWidgets.displayFlag(state.weather.country),
                homeScreenWidgets.displayGreeting(),
                homeScreenWidgets.getWeatherIcon(state.weather.weatherConditionCode!),
                homeScreenWidgets.displayWeatherTemperature(state.weather.temperature!.celsius!.round()),
                homeScreenWidgets.displayWeatherCondition(state.weather.weatherMain! ),
                homeScreenWidgets.displayCurrentDate(state.weather.date!),
                Row(
                  children: [
                    homeScreenWidgets.displayWeatherDetails('assets/11.png', 'Sunrise',
                        DateFormat().add_jm().format(state.weather.sunrise!).toString()),
                    homeScreenWidgets.displayWeatherDetails('assets/12.png', 'Sunset',
                        DateFormat().add_jm().format(state.weather.sunset!).toString()),
                  ],
                ),

                homeScreenWidgets.displayDivider(),

                Row(
                  children: [
                    homeScreenWidgets.displayWeatherDetails('assets/14.png', 'Temp Min', state.weather.tempMin!.celsius!.round().toString()+'° C'),
                    homeScreenWidgets.displayWeatherDetails('assets/14.png', 'Temp Max', state.weather.tempMax!.celsius!.round().toString()+'° C'),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
