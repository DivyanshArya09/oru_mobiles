import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oru_mobiles/core/helpers/user_helper.dart';

class PushNotificationService {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    try {
      await _fcm.setAutoInitEnabled(true);
      await _fcm.requestPermission();
      await _getToken();
      await _initLocalNotifications();
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  static Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(settings);
  }

  static Future<void> _handleMessage(RemoteMessage message) async {
    if (message.notification != null) {
      _showNotification(message);
    }
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'high_importance_channel', // Ensure this matches AndroidManifest.xml
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      0,
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      details,
    );
  }

  static Future<String?> _getToken() async {
    String? token = UserHelper.getFcmToken();

    debugPrint('Token: $token');
    if (token == null || token.isEmpty) {
      token = await _fcm.getToken();
      if (token != null) {
        UserHelper.setFcmToken(token);
      }
    }
    debugPrint('Token divyansh: $token');
    return token;
  }

  static Future<void> initialize() async {
    FirebaseMessaging.onMessage.listen(_handleMessage);
    FirebaseMessaging.onBackgroundMessage(_handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }
}
