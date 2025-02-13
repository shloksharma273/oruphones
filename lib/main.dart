import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:oruphones/authentication/splash_screen.dart';
import 'package:oruphones/firebase/firebase_api.dart';
import 'package:oruphones/homescreen/homescreen.dart';
import 'package:oruphones/homescreen/test.dart';

import 'authentication/login_screen.dart';

Future<void> _backgroundHandler(RemoteMessage message) async {
  // Handle background message
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  await FirebaseApi().initNotifications();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
class NotificationWidget extends StatefulWidget {
  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}
class _NotificationWidgetState extends State<NotificationWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked! ${message.messageId}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Waiting for messages'),
    );
  }
}