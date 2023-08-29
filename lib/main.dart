import 'package:flutter/material.dart';
import '../views/SplashScreen.dart';
import 'appconfig.dart';

void main() {
  runApp(
    SplashScreen(key: UniqueKey(), onInitializationComplete: () => MyApp()),
  );
}
