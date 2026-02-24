import 'dart:ui';

import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(color: Colors.black),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/startBg.png', fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 55, 25, 55),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Влюбитесь в кофе в блаженном восторге!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Добро пожаловать в наш уютный кофейный уголок, где каждая чашка - это наслаждение для вас.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromRGBO(162, 162, 162, 100), fontSize: 14),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      child: Text(
                        'Начать',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
