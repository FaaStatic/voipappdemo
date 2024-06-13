import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/di/router_injection.dart';
import 'package:myapp/core/di/shared_preferences_injection.dart';
import 'package:myapp/core/notification/notification_util.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/gen/fonts.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

@pragma("vm:entry-point")
Future<void> _onActionReceivedMethod(
    ReceivedAction receivedAction, RemoteMessage message) async {
  // Your code goes here
  if (receivedAction.actionType == ActionType.Default) {
    print(message.data);
    print(receivedAction.payload);
  } else {
    print("dismissed");
  }
  // Navigate into pages, avoiding to open the notification details page over another details page already opened
}

@pragma("vm:entry-point")
Future<void> _handlerBackgroundMessage(RemoteMessage message) async {
  print("message received from background");
  await AwesomeNotifications().setListeners(
    onActionReceivedMethod: (received) {
      return _onActionReceivedMethod(received, message);
    },
  );
  await NotificationUtil().showNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcm = FirebaseMessaging.instance;
  await NotificationUtil().setupNotification(fcm);
  FirebaseMessaging.onBackgroundMessage(_handlerBackgroundMessage);
  final prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(overrides: [
    sharedPreferencesInjection.overrideWithValue(prefs),
  ], child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((message) async {
      print("message received from foreground");
      await AwesomeNotifications().setListeners(
        onActionReceivedMethod: (received) {
          return _onActionReceivedMethod(received, message);
        },
      );
      await NotificationUtil().showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      print("message received from forebackground");
      await AwesomeNotifications().setListeners(
        onActionReceivedMethod: (received) {
          return _onActionReceivedMethod(received, message);
        },
      );
      await NotificationUtil().showNotification(message);
    });
    super.initState();
  }

  @override
  void dispose() {
    AwesomeNotifications().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerInjectionProvider),
      themeMode: ThemeMode.dark,
      theme:
          ThemeData(useMaterial3: true, fontFamily: FontFamily.plusJakartaSans),
    );
  }
}
