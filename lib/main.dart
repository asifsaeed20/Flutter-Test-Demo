import 'package:covid_tracker/home_screen.dart';
import 'package:covid_tracker/screen_2.dart';
import 'package:covid_tracker/utils/routes.dart';
import 'package:covid_tracker/utils/routes_names.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light() ,
     initialRoute: Routename.homescreen,
      onGenerateRoute: routes.generateroute,

    );
  }
}

