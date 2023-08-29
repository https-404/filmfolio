import 'package:filmfolio/res/Routes/routeName.dart';
import 'package:filmfolio/res/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  SplashScreen({required Key key, required this.onInitializationComplete})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1))
        .then((_) => widget.onInitializationComplete());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "FilmFolio",
      theme: Apptheme.theme,
      initialRoute: RouteName.mainpage,
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.contain, image: AssetImage("assets/images/logo.png"))),
        ),
      ),
    );
  }
}
