import 'package:flutter/material.dart';
import 'package:uts/Screens/Home_Screen.dart';
import 'package:uts/Screens/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This Widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorScreen(),
    );
  }
}
