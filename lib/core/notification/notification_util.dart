import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

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
    await AwesomeNotifications().initialize(null, [_channelAndroid], debug: true);
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
    AwesomeNotifications().requestPermissionToSendNotifications();
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3630009455.
    fcm.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  fcm.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  }
});
   
  }

  Future<void> showNotification(RemoteMessage message) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: _channelAndroid.channelKey ?? "com.suhaili.voipapp",
        title: message.notification!.title,
        body: message.notification!.body,
      ),
    );
  }
}
