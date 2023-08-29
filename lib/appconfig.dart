import 'package:filmfolio/res/Routes/routeName.dart';
import 'package:filmfolio/res/Routes/routing.dart';
import 'package:filmfolio/res/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "FilmFolio",
      initialRoute: RouteName.mainpage,
      theme: Apptheme.theme,
      routes: routes,
    );
  }
}
