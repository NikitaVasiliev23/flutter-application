import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final notificationsList = [
      {
        'title': localizations.notificationTitle1,
        'description': localizations.notificationDescription1,
        'date': '15.02.2026',
      },
      {
        'title': localizations.notificationTitle2,
        'description': localizations.notificationDescription2,
        'date': '15.02.2026',
      },
      {
        'title': localizations.notificationTitle3,
        'description': localizations.notificationDescription3,
        'date': '15.02.2026',
      },
      {
        'title': localizations.notificationTitle4,
        'description': localizations.notificationDescription4,
        'date': '15.02.2026',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notificationsPageTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notificationsList.length,
        itemBuilder: (context, index) {
          final item = notificationsList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] as String,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item['description'] as String,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item['date'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(162, 162, 162, 1),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
