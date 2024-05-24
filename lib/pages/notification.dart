import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const route = '/notification';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message.notification?.title ?? 'empty'),
            Text(message.notification?.body ?? 'empty'),
            Text(message.data.toString()),
          ],
        ),
      ),
    );
  }
}
