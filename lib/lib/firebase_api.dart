import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notifications/main.dart';
import 'package:push_notifications/pages/notification.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('token $fcmToken');
    initPushNotifications();
  }

  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState
        ?.pushNamed(NotificationPage.route, arguments: message);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(
      'title: ${message.notification?.title}, content: ${message.notification?.body}, payload: ${message.data}');
}
