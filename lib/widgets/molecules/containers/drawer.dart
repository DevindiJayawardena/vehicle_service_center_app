import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehicle_service_center_app/controller/profile_controller.dart';

import '../../../const/constants.dart';
import '../../../screens/auth/login_screen.dart';
import '../../../screens/main/chatbot_screen.dart';
import '../../../screens/main/contact_us_screen.dart';
import '../../../screens/main/home_screen.dart';
import '../../../screens/main/my_bills_screen.dart';
import '../../../screens/main/update_personal_info_screen.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  //const DrawerWidget({Key? key}) : super(key: key);
  Future<void>? _launched;

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  ProfileController profileController = Get.put(ProfileController());

  bool language_set = true;
  bool appearance = false;

  @override
  Widget build(BuildContext context) {
    const String toLaunch_youtube =
        'https://www.youtube.com/watch?v=dds2X3a9Iv4';
    const String toLaunch_facebook = 'https://www.facebook.com/gtag.me/';
    const String toLaunch_instagram = 'https://www.instagram.com/gtag.me/';
    const String toLaunch_view_a_sample = 'https://gtag.me/u/johnsmith/';

    return Container(
      child: Drawer(
        backgroundColor: Constants.appColorAmberLight,
        child: ListView(
          children: <Widget>[
            // Container(
            //   height: 96,
            //   child: const DrawerHeader(
            //     margin: EdgeInsets.all(10.0),
            //     decoration: BoxDecoration(
            //       //color: Constant.appColorPink,
            //       // border: Border(
            //       //   bottom: BorderSide(color: Constant.appColorMoreDarkPink, width: 4),
            //       //   top: BorderSide(color: Constant.appColorMoreDarkPink, width: 1),
            //       // ),
            //       image: DecorationImage(
            //         image: AssetImage(
            //           "assets/icons/logo.png",
            //         ),
            //         fit: BoxFit.contain,
            //       ),
            //     ),
            //     child: Text(''),
            //   ),
            // ),

            SizedBox(height: 1),

            SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.settings_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'Profile Settings',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UpdatePersonalInfoScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.car_repair_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'Vehicle Info',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      profileController.viewOrAddVehicle();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.chat_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'Ask from Bot',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatbotScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.color_lens_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Appearance : Dark',
                          style: TextStyle(
                            color: Constants.appColorBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        FlutterSwitch(
                          activeColor: Constants.appColorAmberDark,
                          width: 69.0,
                          height: 30.0,
                          valueFontSize: 11.0,
                          toggleSize: 45.0,
                          value: appearance,
                          borderRadius: 20.0,
                          padding: 4.0,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              appearance = val;
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ContactGtagScreen()),
                      // );
                      //Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.language_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Language : English',
                          style: TextStyle(
                            color: Constants.appColorBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        FlutterSwitch(
                          activeColor: Constants.appColorAmberDark,
                          width: 69.0,
                          height: 30.0,
                          valueFontSize: 11.0,
                          toggleSize: 45.0,
                          value: language_set,
                          borderRadius: 20.0,
                          padding: 4.0,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              language_set = val;
                            });
                          },
                        ),
                      ],
                    ),
                    // title: const Text('Language : English', style: TextStyle(
                    //   color: Constants.appColorBlack,
                    //   fontWeight: FontWeight.w600,
                    // ),),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ContactGtagScreen()),
                      // );
                      //Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.summarize_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'My Bills',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyBillsScreen()),
                      );
                      //Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactUsScreen()),
                      );
                      //Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ContactGtagScreen()),
                      // );
                      //Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: Constants.appColorAmberDark,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Constants.appColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                      //Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
