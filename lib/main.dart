import 'package:flutter/material.dart';
import 'package:application/startPage.dart';
import 'package:application/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Приложение',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        )
      ),
      initialRoute: '/',
      routes: {'/': (context) => StartPage(), '/home': (context) => MainPage()},
    );
  }
}
