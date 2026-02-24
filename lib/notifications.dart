import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> notificationsList = const [
    {
      'title': 'Новый сорт кофе из Эфиопии',
      'description': 'Попробуйте новый сорт кофе с нотами черники и шоколада',
      'date': '15.02.2026',
    },
    {
      'title': 'Скидка 20% на весь кофе',
      'description': 'Только в выходные - скидка 20% на все напитки',
      'date': '14.02.2026',
    },
    {
      'title': 'Мастер-класс по приготовлению кофе',
      'description': 'Научитесь готовить идеальный капучино',
      'date': '05.02.2026',
    },

    {
      'title': 'Новая кофемашина',
      'description': 'Теперь варим кофе на профессиональной La Marzocco',
      'date': '15.01.2026',
    },
  ];

  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Уведомления'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: notificationsList.map((item) {
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    item['title'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(item['description'], style: TextStyle(fontSize: 14)),
                  SizedBox(height: 5),
                  Text(
                    item['date'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(162, 162, 162, 1),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
