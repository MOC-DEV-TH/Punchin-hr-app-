
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../main.dart';
import '../utils/secure_storage.dart';
import '../utils/strings.dart';

@pragma('vm:entry-point')
void notificationTapBackground(
    NotificationResponse response,
    ) {
  debugPrint(
    'Notification tapped: ${response.id}, '
        'payload: ${response.payload}',
  );
}

final FlutterLocalNotificationsPlugin _localNotifications =
FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel _androidChannel =
AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'Important HR app notifications',
  importance: Importance.high,
);

class FirebaseApi {
  FirebaseApi();

  static const String _hrTopic = 'hr-app';
  static const String _allUsersTopic = 'all_users';
  static const String _enabledKey = 'notifications_enabled';

  final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static bool _localInitialized = false;
  static bool _timezoneInitialized = false;

  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  StreamSubscription<RemoteMessage>? _onOpenedSubscription;
  StreamSubscription<String>? _tokenSubscription;

  // ------------------------------------------------
  // NOTIFICATION SETTINGS
  // ------------------------------------------------

  Future<bool> isNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_enabledKey) ?? true;
  }

  Future<void> enableNotifications() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final allowed =
        settings.authorizationStatus ==
            AuthorizationStatus.authorized ||
            settings.authorizationStatus ==
                AuthorizationStatus.provisional;

    if (!allowed) {
      debugPrint('Notification permission was not granted');
      return;
    }

    if (Platform.isAndroid) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_enabledKey, true);

    await _subscribeToTopics();
    await _saveFCMToken();
  }

  Future<void> disableNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_enabledKey, false);

    await _firebaseMessaging.unsubscribeFromTopic(_hrTopic);
    await _firebaseMessaging.unsubscribeFromTopic(
      _allUsersTopic,
    );

    // Disable any reminders scheduled by this service.
    for (final id in _reminderIds) {
      await _localNotifications.cancel(id: id);
    }
  }

  // ------------------------------------------------
  // INITIALIZATION
  // ------------------------------------------------

  Future<void> initNotification() async {
    await _initializeLocalNotifications();
    await _initializeTimezone();

    await _firebaseMessaging
        .setForegroundNotificationPresentationOptions(
      // Android uses the local notification below.
      // iOS uses the system presentation.
      alert: Platform.isIOS,
      badge: Platform.isIOS,
      sound: Platform.isIOS,
    );

    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint(
      'FCM authorization status: '
          '${settings.authorizationStatus}',
    );

    if (await isNotificationsEnabled()) {
      await _subscribeToTopics();
      await _saveFCMToken();
    }

    await initPushNotification(container);

    _tokenSubscription ??=
        _firebaseMessaging.onTokenRefresh.listen((token) async {
          if (await isNotificationsEnabled()) {
            await SecureStorage().saveFCMToken(token);
            debugPrint('FCM token refreshed');
          }
        });
  }

  static Future<void> _initializeLocalNotifications() async {
    if (_localInitialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    await _localNotifications.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (response) {
        debugPrint(
          'Notification opened: ${response.payload}',
        );
        // Add application navigation here if needed.
      },
      onDidReceiveBackgroundNotificationResponse:
      notificationTapBackground,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    _localInitialized = true;
  }

  static Future<void> _initializeTimezone() async {
    if (_timezoneInitialized) return;

    tz.initializeTimeZones();

    try {
      final timezone = await FlutterTimezone.getLocalTimezone();

      final identifier = timezone.identifier == 'Asia/Rangoon'
          ? 'Asia/Yangon'
          : timezone.identifier;

      tz.setLocalLocation(tz.getLocation(identifier));

      debugPrint('Notification timezone: $identifier');
    } catch (error) {
      debugPrint('Timezone initialization failed: $error');

      // UTC fallback. Do not silently assume device-local
      // timezone when it cannot be determined.
      tz.setLocalLocation(tz.getLocation('UTC'));
    }

    _timezoneInitialized = true;
  }

  // ------------------------------------------------
  // FCM TOPICS AND TOKEN
  // ------------------------------------------------

  Future<void> _subscribeToTopics() async {
    if (Platform.isIOS) {
      String? apnsToken;

      for (var attempt = 0; attempt < 5; attempt++) {
        apnsToken = await _firebaseMessaging.getAPNSToken();

        if (apnsToken != null) break;

        await Future<void>.delayed(
          const Duration(seconds: 2),
        );
      }

      if (apnsToken == null) {
        debugPrint('APNs token not ready yet');
        return;
      }
    }

    await _firebaseMessaging.subscribeToTopic(_hrTopic);
    await _firebaseMessaging.subscribeToTopic(
      _allUsersTopic,
    );
  }

  Future<void> _saveFCMToken() async {
    try {
      if (Platform.isIOS &&
          await _firebaseMessaging.getAPNSToken() == null) {
        debugPrint('Waiting for APNs token before FCM token');
        return;
      }

      final savedToken = await SecureStorage().getFCMToken();
      final currentToken = await _firebaseMessaging.getToken();

      if (currentToken == null) return;

      if (savedToken != currentToken) {
        await SecureStorage().saveFCMToken(currentToken);
        debugPrint('New FCM token stored');
      }
    } catch (error) {
      debugPrint('Unable to save FCM token: $error');
    }
  }

  // ------------------------------------------------
  // HANDLE NOTIFICATION
  // ------------------------------------------------

  Future<void> handleMessage(
      RemoteMessage? message,
      ProviderContainer ref,
      ) async {
    if (message == null) return;

    final authStatus =
        ref.read(getAuthStatusProvider).value;

    if (authStatus == kAuthLoggedIn) {
      await ref
          .read(secureStorageProvider)
          .saveAuthStatus(kAuthLoggedIn);

      ref.invalidate(secureStorageProvider);
    }
  }

  Future<void> initPushNotification(
      ProviderContainer providerContainer,
      ) async {
    await _initializeLocalNotifications();

    await _onMessageSubscription?.cancel();
    await _onOpenedSubscription?.cancel();

    _onOpenedSubscription =
        FirebaseMessaging.onMessageOpenedApp.listen(
              (message) {
            handleMessage(message, providerContainer);
          },
        );

    // Handle notification that launched a terminated app.
    final initialMessage =
    await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      await handleMessage(initialMessage, providerContainer);
    }

    _onMessageSubscription =
        FirebaseMessaging.onMessage.listen((message) async {
          if (!await isNotificationsEnabled()) return;

          final notification = message.notification;
          if (notification == null) return;

          // iOS foreground presentation is handled by FCM.
          // Avoid duplicate local notifications.
          if (Platform.isIOS) return;

          await _localNotifications.show(
            id: notification.hashCode & 0x7fffffff,
            title: notification.title,
            body: notification.body,
            notificationDetails: NotificationDetails(
              android: AndroidNotificationDetails(
                _androidChannel.id,
                _androidChannel.name,
                channelDescription: _androidChannel.description,
                importance: Importance.high,
                priority: Priority.high,
                icon: '@mipmap/ic_launcher',
              ),
              iOS: const DarwinNotificationDetails(),
            ),
            payload: message.data['route']?.toString(),
          );
        });
  }

  // ------------------------------------------------
  // NOTIFICATION DETAILS
  // ------------------------------------------------

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notification',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // ------------------------------------------------
  // GENERAL DAILY NOTIFICATION
  // ------------------------------------------------

  Future<void> scheduleNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    await _initializeLocalNotifications();
    await _initializeTimezone();

    if (!await isNotificationsEnabled()) return;

    final scheduledDate = _nextTime(
      hour: hour,
      minute: minute,
    );

    await _localNotifications.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: notificationDetails(),
      androidScheduleMode:
      AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // ------------------------------------------------
  // WEEKDAY ATTENDANCE REMINDERS
  // ------------------------------------------------

  static const List<int> _weekdays = [
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
  ];

  static final List<int> _reminderIds = [
    for (final day in _weekdays) ...[
      1000 + day,
      5000 + day,
      6000 + day,
      500 + day,
      600 + day,
    ],
  ];

  static Future<void>
  scheduleDailyCheckInCheckOutNotification() async {
    await _initializeLocalNotifications();
    await _initializeTimezone();

    final prefs = await SharedPreferences.getInstance();
    if (!(prefs.getBool(_enabledKey) ?? true)) return;

    for (final weekday in _weekdays) {
      await _scheduleWeeklyReminder(
        id: 1000 + weekday,
        title: 'Check In Reminder',
        body: 'Good morning! Don’t forget to check in.',
        weekday: weekday,
        hour: 9,
        channelId: 'checkin_channel',
        channelName: 'Check In Notifications',
      );

      await _scheduleWeeklyReminder(
        id: 5000 + weekday,
        title: 'Checkout Reminder',
        body: "It's 5 PM! Please don't forget to checkout.",
        weekday: weekday,
        hour: 17,
        channelId: 'checkout_channel',
        channelName: 'Checkout Reminders',
      );

      await _scheduleWeeklyReminder(
        id: 6000 + weekday,
        title: 'Final Checkout Reminder',
        body: "It's 6 PM! Make sure you have checked out.",
        weekday: weekday,
        hour: 18,
        channelId: 'checkout_channel',
        channelName: 'Checkout Reminders',
      );
    }
  }

  static Future<void> scheduleCheckoutReminders() async {
    await _initializeLocalNotifications();
    await _initializeTimezone();

    final prefs = await SharedPreferences.getInstance();
    if (!(prefs.getBool(_enabledKey) ?? true)) return;

    for (final weekday in _weekdays) {
      await _scheduleWeeklyReminder(
        id: 500 + weekday,
        title: 'Checkout Reminder',
        body: "It's 5 PM! Please don't forget to checkout.",
        weekday: weekday,
        hour: 17,
        channelId: 'checkout_channel',
        channelName: 'Checkout Reminders',
      );

      await _scheduleWeeklyReminder(
        id: 600 + weekday,
        title: 'Final Checkout Reminder',
        body: "It's 6 PM! Make sure you have checked out.",
        weekday: weekday,
        hour: 18,
        channelId: 'checkout_channel',
        channelName: 'Checkout Reminders',
      );
    }
  }

  static Future<void> _scheduleWeeklyReminder({
    required int id,
    required String title,
    required String body,
    required int weekday,
    required int hour,
    required String channelId,
    required String channelName,
  }) async {
    final scheduledDate = _nextWeekdayTime(
      weekday: weekday,
      hour: hour,
    );

    await _localNotifications.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode:
      AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents:
      DateTimeComponents.dayOfWeekAndTime,
    );
  }

  // ------------------------------------------------
  // DATE HELPERS
  // ------------------------------------------------

  static tz.TZDateTime _nextTime({
    required int hour,
    int minute = 0,
  }) {
    final now = tz.TZDateTime.now(tz.local);

    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (!scheduled.isAfter(now)) {
      scheduled = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day + 1,
        hour,
        minute,
      );
    }

    return scheduled;
  }

  static tz.TZDateTime _nextWeekdayTime({
    required int weekday,
    required int hour,
  }) {
    final now = tz.TZDateTime.now(tz.local);

    var daysAhead = (weekday - now.weekday + 7) % 7;

    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day + daysAhead,
      hour,
    );

    if (!scheduled.isAfter(now)) {
      daysAhead += 7;

      scheduled = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day + daysAhead,
        hour,
      );
    }

    return scheduled;
  }

  // ------------------------------------------------
  // CLEANUP
  // ------------------------------------------------

  Future<void> dispose() async {
    await _onMessageSubscription?.cancel();
    await _onOpenedSubscription?.cancel();
    await _tokenSubscription?.cancel();

    _onMessageSubscription = null;
    _onOpenedSubscription = null;
    _tokenSubscription = null;
  }
}
