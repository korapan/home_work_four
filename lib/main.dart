import 'package:flutter/material.dart';
import 'package:home_work_four/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.myColor,
      ),
      home: const Homepage(),
    );
  }
}

class Palette {
  static const MaterialColor myColor = MaterialColor(
    0xff8b2030,
    <int, Color>{
      50: Color(0xff7d1d2b), //10%
      100: Color(0xff6f1a26), //20%
      200: Color(0xff611622), //30%
      300: Color(0xff53131d), //40%
      400: Color(0xff461018), //50%
      500: Color(0xff380d13), //60%
      600: Color(0xff2a0a0e), //70%
      700: Color(0xff1c060a), //80%
      800: Color(0xff0e0305), //90%
      900: Color(0xff000000), //100%
    },
  );
}