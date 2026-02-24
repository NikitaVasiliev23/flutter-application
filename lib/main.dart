import 'package:flutter/material.dart';
import 'package:application/startPage.dart';
// import 'package:application/homePage.dart';
// import 'package:application/examp.dart';
// import 'package:application/notifications.dart';
import 'package:application/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
