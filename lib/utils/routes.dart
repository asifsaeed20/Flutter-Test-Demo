import 'package:flutter/material.dart';
import 'package:covid_tracker/home_screen.dart';
import 'package:covid_tracker/screen_2.dart';
import 'package:covid_tracker/utils/routes_names.dart';

class routes {
  static Route<dynamic> generateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routename.homescreen:
        return MaterialPageRoute(builder: (_) => HomeScreen(data: {}));

      case Routename.screentwo:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => Screen2(data: args), // Passing received arguments
        );

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen(data: {}));
    }
  }
}
