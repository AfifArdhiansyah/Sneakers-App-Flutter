import 'package:flutter/material.dart';
import 'package:test_new_flutter/pages/login_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var firstColor = 0xFF090717;
  var secondColor = 0xFF231C53;
  var thirdColor = 0xFFF1EFFF;
  var fourthColor = 0xFF878787;
  var fifthColor = 0xFF878787;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneakous',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(firstColor)
      ),
      themeMode: ThemeMode.light,
      home: LoginPage(),
    );
  }
}