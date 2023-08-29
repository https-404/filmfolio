import 'package:filmfolio/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Mainpage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return _UIbuild();
  }
}

Widget _UIbuild() {
  return Scaffold(
    body: Center(
      child: Text("Mainpage", ),
    ),
  );
}
