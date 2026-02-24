import 'package:application/homePage.dart';
import 'package:application/notifications.dart';
import 'package:application/orderPage.dart';
import 'package:application/favoritePage.dart';

import 'package:flutter/material.dart';

final List<Map<String, dynamic>> orderList = [];
final List<Map<String, dynamic>> favoriteList = [];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selecttedIndex = 0;

  final List<Widget> _page = [
    const HomePage(),
    const FavoritePage(),
    const OrderPage(),
    const NotificationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selecttedIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selecttedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selecttedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like'),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
