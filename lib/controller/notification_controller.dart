import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/main/my_bills_screen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationController extends GetxController {
  /*AAAAny1-dL4:APA91bGm9e0mj6MHrwLKfm5ji7eyNfXfe01hsbjc65u75fhjt1q6JQWdLQPvuLB3D904nnZx2nj4szms-c6_t--UOlkVR7fAnQYNm5yg5hzycHY-Rv1o8mxMPEIQrbvTzQkV3ECS6JXC*/
  /*683663062206*/
  /*https://firebasestorage.googleapis.com/v0/b/donor-app-83ae2.appspot.com/o/16
  48579468622000.png?alt=media&token=82088a67-e624-466c-b50d-d93b80db6ab3*/
  String? type;

  @override
  void onInit() {
    // IN APP NOTIFICATION
    //inAppNotification();
    //backgroundNotification();
    setupInteractMessage();
    //localNotification();
    super.onInit();
  }

  Future<void> localNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: android.smallIcon,
                // other properties...
              ),
            ));
      }
    });
  }

  Future<void> setupInteractMessage() async {
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    final myBills = GetStorage('myBills');
    print("-------------------------> All Data");
    print(message.data);
    myBills.write('fname', message.data['customer_first_name']);
    myBills.write('lName', message.data['customer_first_name']);
    myBills.write('date', message.data['date']);
    myBills.write('paymentType', "CASH/CARD");
    myBills.write('discount', message.data['discount']);
    myBills.write('subtotal', message.data['price']);
    myBills.write('serviceId', message.data['id']);
    myBills.write('nic', message.data['nic_number']);
    myBills.write('email', message.data['email']);
    myBills.write('vehicleType', message.data['vehicle_type']);
    myBills.write('vehicleNumber', message.data['vehicle_number']);
    myBills.write('upgradeType', message.data['upgrade_type_name']);
    myBills.write('serviceId', message.data['id']);

    String discount = message.data['discount'].toString();
    double price = double.parse(message.data['price'].toString());
    if (discount == "0") {
      myBills.write('total', message.data['price']);
    } else {
      double doubleDiscount = double.parse(discount);
      var disValue = (price / 100) * doubleDiscount;
      var total = price - disValue;
      myBills.write('total', total.toString());
    }

    /*{date: 2022:06:13,
    rating: 0,
    description: description,
    appointment_id: 30,
    discount: 0,
    created_at: 2022:06:13 15:19,
    employee_phone_number: 0912345678,
    is_completed: 1,
    customer_last_name: Madhushan,
    price: 1000,
    employee_nic_number: 3849586859,
    id: 12, is_paid: 0,
    vehicle_id: 36,
    nic_number: 7685757468V,
    email: vinod@abc.com,
    employee_first_name: Vinod,
    time_slot_id: 3,
    is_done: 1,
    employee_address: fkkjsnd,
    customer_first_name: Vinod,
    employee_last_name: Madhushan,
    end_time: 11, vehicle_type: Car,
    upgrade_type_id: 2,
    contact_number: 0712345678,
    start_time: 10,
    employee_email: vinodmadhu97@gmail.com,
    vehicle_number: CCA-1245,
    employee_id: 41,
    upgrade_type_name: sample,
    customer_id: 26, status: Arrived
    }*/

    Get.to(() => MyBillsScreen());
  }

  /*void inAppNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      type = message.data['type'];
      print(message.data);
      print("IN APP");
      NotificationApi.showSimpleNotification();
      listenNotification();
    });
  }*/

  /*void listenNotification() {
    NotificationApi.onNotification.stream.listen((onClickNotification));
  }*/

  /*void onClickNotification(String? payload) {
    if (type != null) {
      if (type == "request") {
        Get.to(RequestScreen());
      } else if (type == "campaign") {
        Get.to(CampaignsScreen());
      } else {
        Get.to(DashBoardScreen());
      }
    }
  }*/

  /*void backgroundNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      type = message.data['type'];
      print("------------------------------------>to=${message.data['to']}");
      print("------------------------------------>bg=${message.data['url']}");

      if (notification != null && android != null) {
        if (message.data['type'] == "request") {
          Get.to(RequestScreen());
        } else if (message.data['type'] == "campaign") {
          Get.to(CampaignsScreen());
        } else {
          Get.to(DashBoardScreen());
        }
      }
    });
  }*/
}

/*class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();

  static Future init({bool initScheduled = false}) async {
    var androidSettings = AndroidInitializationSettings('mipmap/ic_launcher');
    var iosSettings = IOSInitializationSettings();

    var settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _notification.initialize(settings,
        onSelectNotification: (payload) async {
      onNotification.add(payload);
    });
  }

  static Future showSimpleNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    print("------------------------->payload$payload");
    return _notification.show(
        id, title, body, await _simpleNotificationDetails(),
        payload: payload);
  }

  static Future _simpleNotificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
          "channel id",
          "channel name",
          channelDescription: "channel description",
          importance: Importance.max,
        ),
        iOS: IOSNotificationDetails());
  }
}*/
