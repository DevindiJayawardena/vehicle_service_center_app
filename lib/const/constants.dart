import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class Constants{

  static const appColorBrownRed = Color(0xffD92027);
  static const appColorRed = Color(0xffd7454a);
  static const appColorBrownRedLight = Color(0xFFD92027);
  static const appColorAmber = Color(0xffe3cb81);
  static const appColorAmberTwo = Color(0xfff6e7b7);
  static const appColorAmberLight = Color(0xfff8f1db);
  static const appColorAmberMoreLight = Color(0xfffaf6eb);
  static const appColorAmberDark = Color(0xffd5b449);
  static const appColorAmberMoreDark = Color(0xffa5810f);
  static const appColorAmberMoreDarkTwo = Color(0xff6c5304);
  static const appColorWhite = Color(0xffffffff);
  static const appColorBlack = Color(0xff000000);
  static const appColorGray = Color(0xffc4c4c4);
  static const appColorGrayTwo = Color(0xffa09f9f);

  static const MaterialColor appColorbrownRedSwatch = MaterialColor(0xffD92027, <int, Color>{
    50: Color(0xffD92027),
    100: Color(0xffD92027),
    200: Color(0xffD92027),
    300: Color(0xffD92027),
    400: Color(0xffD92027),
    500: Color(0xffD92027),
    600: Color(0xffD92027),
    700: Color(0xffD92027),
    800: Color(0xffD92027),
    900: Color(0xffD92027),
  });


  static bool isLogged = true;

  // final List<AdItem> adList = [
  //   AdItem(
  //     id: 0,
  //     title: "Bmw 740Le 2000CC Twin Turbo 2021",
  //     location: "Colombo, Sri Lanka",
  //     price: "\$ 35,500.00",
  //     time: "2 Minutes",
  //     isFavorite: true,
  //     imgUrl: ["assets/images/car1.png","assets/images/car4.png","assets/images/car3.png"],
  //     description: Description(
  //       fieldName: "Description",
  //       details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry." +
  //               "Lorem Ipsum is simply dummy text of the printing and typesetting industry."+
  //               "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n"+
  //               "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
  //     ),
  //     specifics: Specifics(
  //     dataList: [
  //       {
  //         'name':'brand',
  //         'value':'BMW',
  //       },
  //       {
  //         'name':'model',
  //         'value':'X1',
  //       },
  //       {
  //         'name':'condition',
  //         'value':'New',
  //       },
  //       {
  //         'name':'transition',
  //         'value':'Automatic',
  //       },
  //       {
  //         'name':'mileage',
  //         'value':'0km',
  //       },
  //       {
  //         'name':'category',
  //         'value':'Cars',
  //       },
  //
  //     ]
  //     ),
  //
  //
  //     contact: Contact(
  //     dataList: [
  //       {
  //         'name':'mobile',
  //         'value':'+94775686123',
  //       },
  //       {
  //         'name':'email',
  //         'value':'dilanpushpitha@gmail.com',
  //       },
  //       {
  //         'name':'website',
  //         'value':'www.geo.com'
  //       },
  //     ],
  //     ),
  //   ),
  // ];


  //<-------------DROPDOWN DATA LISTS----------------->
  List<dynamic> vehicleList = [
    {"id": 1, "label": "KJ-4923"},
    {"id": 2, "label": "301-9772"},
    {"id": 3, "label": "CI-6798"},
    {"id": 4, "label": "KAC-1009"},
  ];

  List<dynamic> conditionTypeList = [
    {"id": 1, "label": "Used"},
    {"id": 2, "label": "Brand New"},
  ];

  List<dynamic> transmissionTypeList = [
    {"id": 1, "label": "Automation"},
    {"id": 2, "label": "Manual"},
  ];

  List<dynamic> fuelTypeList = [
    {"id": 1, "label": "Petrol"},
    {"id": 2, "label": "Diesel"},
  ];


  List<dynamic> vehicleTypeList = [
    {"id": 1, "label": "Car"},
    {"id": 2, "label": "Van"},
    {"id": 3, "label": "Jeep"},
    {"id": 4, "label": "Motor Bike"},
    {"id": 4, "label": "Bus"},
  ];


  List<dynamic> serviceTypesList = [
    {"id": 1, "label": "Interior Cleaning"},
    {"id": 2, "label": "Oil Changing"},
    {"id": 3, "label": "Waxing"},
    {"id": 4, "label": "Clutch Balancing"},
  ];


  //LOCATIONS
  List<dynamic> locationList = [
    {"id": 1, "label": "Colombo"},
    {"id": 2, "label": "Gampaha"},
    {"id": 3, "label": "Matara"},
    {"id": 4, "label": "Kandy"},
    {"id": 5, "label": "Kurunegala"},
    {"id": 6, "label": "Galle"},
  ];

  //BRAND LIST
  List<dynamic> brandsList = [
    {"id": 1, "label": "Toyota"},
    {"id": 2, "label": "BMW"},
  ];

  //MODEL LIST
  List<dynamic> modelsList = [
    {"Id": 1, "model": "Toyota 1", "parentId": 1},
    {"Id": 2, "model": "Toyota 2", "parentId": 1},
    {"Id": 3, "model": "Toyota 3", "parentId": 1},
    {"Id": 4, "model": "Toyota 4", "parentId": 1},
    {"Id": 1, "model": "BMW 1", "parentId": 2},
    {"Id": 2, "model": "BMW 2", "parentId": 2},
    {"Id": 3, "model": "BMW 3", "parentId": 2}
  ];

  List<dynamic> modelYearList = [
    {"id": 1, "label": "1997"},
    {"id": 2, "label": "1999"},
    {"id": 3, "label": "2000"},
    {"id": 4, "label": "2010"},
    {"id": 5, "label": "2015"},
    {"id": 6, "label": "2020"},
  ];

  List<dynamic> conditions = [
    {"id": 1, "label": "New"},
    {"id": 2, "label": "Used"},
  ];




  //<-------------SHARED PREFERENCES----------------->
  static const String IS_APP_INSTALLED = "isAppInstalled";
  static bool isInstalled = false;

  final Future<SharedPreferences> _mSF = SharedPreferences.getInstance();

  //set app installed data
  Future<void> setAppInstalledDataInSF(String key, bool value) async {
    final SharedPreferences prefs = await _mSF;

    prefs.setBool(key, value);

  }

  Future<void> getAppInstalledDataInSF(String key) async {
    final SharedPreferences prefs = await _mSF;

    if(prefs.containsKey(key)){
      //return true;
      isInstalled = true;
    }else{
      isInstalled = false;
    }
    //return false;


  }

  /*//<-----------------------CHECK INTERNET CONNECTION------------------>
  static Future<bool> checkInternet() async{
    bool hasConnect =  await InternetConnectionChecker().hasConnection;


    if(!hasConnect){

      showSimpleNotification(
          const Text(
            "No Internet Connection",
          ),
          background: Colors.black54
      );


      return false;
    }else{
      return true;
    }
  }*/

  //<-------------SHOWING TOAST MESSAGES----------------->
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: appColorBrownRed.withOpacity(0.8),
        textColor: appColorWhite
    );
  }

  //<-------------CHECKING CAMERA PERMISSION----------------->
  // void checkCameraPermission(BuildContext context,Function getUrl) async{
  //   var cameraStatus = await Permission.camera.status;
  //
  //   if (!cameraStatus.isGranted)
  //
  //     await Permission.camera.request();
  //
  //
  //   if (cameraStatus.isDenied) {
  //     Constants().showToast("sdsds");
  //     CustomAlertDialog(
  //         context: context,
  //         activeText: "Go",
  //         deActiveText: "Cancel",
  //         activeClickEvent: openAppSettings,
  //         deActiveClickEvent: (){Navigator.of(context).pop();},
  //         title: "Camera Permission required",
  //         description: "do you want to give the camera permission"
  //     );
  //
  //   }
  //
  //   if(await Permission.camera.isGranted){
  //     Constants().takePhoto(ImageSource.camera,getUrl);
  //     print("captured");
  //   }else{
  //     /*showDialog(context: context, builder: builder)*/
  //     CustomAlertDialog(
  //         context: context,
  //         activeText: "Go",
  //         deActiveText: "Cancel",
  //         activeClickEvent: openAppSettings,
  //         deActiveClickEvent: (){Navigator.of(context).pop();},
  //         title: "Camera Permission required",
  //         description: "do you want to give the camera permission"
  //     );
  //     Constants().showToast("Provide Camera permission to use camera.");
  //     //openAppSettings();
  //
  //   }
  // }

  DateTime selectedDate = DateTime.now();
  // void takePhoto(ImageSource source,Function getImage) async {
  //   final ImagePicker _picker = ImagePicker();
  //
  //   try{
  //     final pickedFile = await _picker.pickImage(source: source,);
  //     if(pickedFile != null){
  //       getImage(pickedFile.path);
  //
  //     }else{
  //       getImage("");
  //     }
  //
  //   }catch(e){
  //     print(e.toString());
  //   }
  //
  // }

  static Future openLink({required String url,}) => _launchUrl(url);
  static Future _launchUrl(String url) async {
    print(url);

    await launch(url);

  }


}