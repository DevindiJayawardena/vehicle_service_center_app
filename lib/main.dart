import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/controller/notification_controller.dart';
import 'package:vehicle_service_center_app/screens/auth/sign_up_screen.dart';
import 'package:vehicle_service_center_app/screens/main/home_screen.dart';
import 'package:vehicle_service_center_app/screens/main/user_registeration_screen.dart';
import 'package:vehicle_service_center_app/screens/startup/onboarding_screen.dart';

import 'const/constants.dart';
import 'controller/network_controller.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        "This channel is used for important notifications.", // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init('userBox');
  Get.lazyPut<NetworkController>(() => NetworkController(), fenix: true);
  Get.put(NotificationController(), permanent: true);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  //HANDLE BACKGROUND NOTIFICATION
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: FeedbackScreen(),
      //home: SignUpScreen(),
      home: FutureBuilder(
          future: Init.instance.initialize(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashLoading();
            }
            return UpComingScreen();
          }),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.
    await Constants().getAppInstalledDataInSF(Constants.IS_APP_INSTALLED);
    await Future.delayed(const Duration(seconds: 2));
  }
}

class SplashLoading extends StatelessWidget {
  const SplashLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.appColorAmber,
      body: Center(
        child: Image.asset(
          "assets/icons/logo.png",
          height: 350,
          width: 300,
        ),
      ),
    );
  }
}

class UpComingScreen extends StatelessWidget {
  const UpComingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getScreen();
  }

  bool hasToken() {
    final userBox = GetStorage('userBox');
    var token = userBox.read('token');
    if (token != null) {
      if (token.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool isProfileComplete() {
    final userBox = GetStorage('userBox');
    var value = userBox.read('is_complete');
    if (value != null) {
      if (value == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool isAppInstalled() {
    final userBox = GetStorage('userBox');
    var isInstalled = userBox.read('is_installed');
    if (isInstalled != null) {
      if (isInstalled) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Widget getScreen() {
    var token = hasToken();
    var isProfileCompleted = isProfileComplete();
    if (!isAppInstalled()) {
      return OnBoardingScreen();
    } else {
      //return token ? HomeScreen() : SignUpScreen();
      if (token) {
        if (isProfileCompleted) {
          return HomeScreen();
        } else {
          return UserRegistrationScreen();
        }
      } else {
        return SignUpScreen();
      }
    }
  }
}
