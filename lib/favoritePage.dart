import 'package:application/mainPage.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Любимый кофе'), centerTitle: true),
      body: favoriteList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Нет любимого кофе :(',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: favoriteList.map((item) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item['coffeType'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(162, 162, 162, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
