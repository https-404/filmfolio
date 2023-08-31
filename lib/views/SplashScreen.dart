import 'dart:convert';
import 'package:filmfolio/service/httpService.dart';
import '../service/movie_service.dart';
import '../model/app_config.dart';
import 'package:filmfolio/res/Routes/routeName.dart';
import 'package:filmfolio/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

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
    Future.delayed(Duration(seconds: 2)).then(
        (_) => _setup(context).then((_) => widget.onInitializationComplete()));
  }

  Future<void> _setup(BuildContext _context) async {
    final getit = GetIt.instance;
    final config = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(config);

    getit.registerSingleton<AppConfig>(AppConfig(configData['BASE_API_URL'],
        configData['API_KEY'], configData['BASE_IMAGE_API_URL']));
    getit.registerSingleton<HttpService>(
      HttpService(),
    );
    getit.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FilmFolio",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: RouteName.mainpage,
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/logo.png"))),
        ),
      ),
    );
  }
}
