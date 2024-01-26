import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreenWidgets {

  Widget drawPurpleCircle(double start, double y) {
    return Align(
      alignment: AlignmentDirectional(start, y),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget drawOrangeSquare(double start, double y) {
    return Align(
      alignment: AlignmentDirectional(start, y),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget produceGradientColor(double sigmaX, double sigmaY) {

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 100.0,
        sigmaY: 100.0
      ),

      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
      ),
    );

  }

  Widget displayCurrentLocation(String? currentLocation) {
    return Text(
      ' ${currentLocation}',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget displayGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    String greeting;

    if (hour >= 5 && hour < 12) {
      greeting = 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return Text(
      greeting,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
  Widget displayWeatherImage() {
    return Image.asset('assets/1.png');
  }

  Widget displayWeatherTemperature(int? temperature) {
    return Center(
      child: Text(
        '$temperature° C',
        style: TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget displayWeatherCondition(String weather) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$weather',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget displayCurrentDate(DateTime currentDateTime) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('EEEE dd').add_jm().format(currentDateTime),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget displayWeatherDetails(String filename, String label, String data) {
    return Row(
      children: [
        Image.asset(
          filename,
          scale: 8,
        ),

        SizedBox(width: 5,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),

            SizedBox(width: 3),

            Text(
              data,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),

          ],
        ),

      ],
    );
  }

  Widget displayDivider() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300 :
        return Image.asset(
            'assets/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
            'assets/7.png'
        );
      default:
        return Image.asset(
            'assets/7.png'
        );
    }
  }

  Widget displayFlag(String? currentLocation) {
    String flagImage;

    if (currentLocation?.toLowerCase() == 'my') {
      flagImage = 'assets/malaysia.png';
    } else if (currentLocation?.toLowerCase() == 'sg') {
      flagImage = 'assets/singapore.png';
    } else if (currentLocation?.toLowerCase() == 'jp') {
      flagImage = 'assets/japan.png';
    } else {
      flagImage = 'assets/watermelon.png';
    }
    return Image.asset(
      flagImage,
      height: 50,
      width: 50,
    );
  }

}