import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.fromLTRB(24, 55, 25, 55),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.startPageTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    AppLocalizations.of(context)!.startPageDescription,
                    textAlign: TextAlign.center,
                    style: const  TextStyle(
                      color: Color.fromRGBO(162, 162, 162, 100),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    constraints: const BoxConstraints(minHeight: 50),

                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      child:  Text(
                        AppLocalizations.of(context)!.startPageButton,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
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
