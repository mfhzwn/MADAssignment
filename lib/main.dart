import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab12/screens/home_screen.dart';
import 'package:geolocator/geolocator.dart';

import 'bloc/weather_bloc_bloc.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snap) {
            if(snap.hasData) {
              return BlocProvider<WeatherBlocBloc>(
                create: (context) => WeatherBlocBloc()..add(
                    FetchWeather(snap.data as Position)
                ),
                child: HomeScreen(),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
      ),
      debugShowCheckedModeBanner: false,

    );

  }

}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  // Test if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied){
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever){
    return Future.error( 'Location permissions are permanently denied, '
        'we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}
