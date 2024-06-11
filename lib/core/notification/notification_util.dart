import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/notification/notification_controller.dart';

class NotificationUtil {
  static final NotificationUtil _main = NotificationUtil._internal();

  factory NotificationUtil() => _main;

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2539174990.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1202777935.
  NotificationUtil._internal();

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2822963953.
  final _channelAndroid = NotificationChannel(
    channelKey: "com.suhaili.voip",
    channelName: "Voip Demo Notification Channel",
    channelDescription: "Channel Voip Demo notification",
    importance: NotificationImportance.High,
    playSound: true,
    enableVibration: true,
  );

  Future<void> setupNotification(FirebaseMessaging fcm) async {
    await AwesomeNotifications()
        .initialize(null, [_channelAndroid], debug: true);
     await AwesomeNotifications().requestPermissionToSendNotifications();
      final settings = await fcm.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await fcm.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  print('User granted permission');
} else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  print('User granted provisional permission');
} else {
  print('User declined or has not accepted permission');
}
      }

  Future<void> showNotification(RemoteMessage message) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: _channelAndroid.channelKey ?? "com.suhaili.voipapp",
        title: message.notification!.title,
        body: message.notification!.body,
      
      ),
      actionButtons: [
// Suggested code may be subject to a license. Learn more: ~LicenseLog:218362077.
        NotificationActionButton(key: "accept", label: "Accept", color: Colors.blue),
        NotificationActionButton(key: "reject", label: "Reject", color: Colors.red, actionType: ActionType.DismissAction)
      ]
    );
    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: (received) {
         return NotificationController.onActionReceivedMethod(received, message);
        },
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }
  Future<void> showNotificationTest() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: _channelAndroid.channelKey ?? "com.suhaili.voipapp",
        title: "tes",
        body: "tes",
      
      ),
      actionButtons: [
// Suggested code may be subject to a license. Learn more: ~LicenseLog:218362077.
        NotificationActionButton(key: "accept", label: "Accept", color: Colors.blue),
        NotificationActionButton(key: "reject", label: "Reject", color: Colors.red, actionType: ActionType.DismissAction)
      ]
    );
   
  }
}
