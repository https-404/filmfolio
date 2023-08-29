import 'package:filmfolio/views/SplashScreen.dart';
import 'package:filmfolio/views/mainpage_view.dart';
import 'package:flutter/cupertino.dart';

import 'routeName.dart';

final Map<String, WidgetBuilder> routes = {
  RouteName.mainpage: (BuildContext context) => Mainpage(),
};
