import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../atoms/app_label.dart';
import '../../molecules/containers/drawer.dart';

class ContactUsTemplate extends StatelessWidget {
  final String imgUrl;

  const ContactUsTemplate({Key? key, required this.imgUrl}) : super(key: key);

  _callNumber() async {
    const number = '0767233765'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Constants.appColorAmberDark.withOpacity(0.37),
        /* .....*/
        elevation: 0,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Got Any Questions?".tr,
                      style: TextStyle(
                        color: Constants.appColorAmberDark,
                        fontSize: 32,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLabel(
                      text: "Email us now!".tr, widgetSize: WidgetSize.medium),
                  Text("                                      "),
                ],
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.email_outlined,
                  color: Constants.appColorGray,
                ),
                label: Text(
                  'info@servicecenter.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Constants.appColorAmber,
                  ),
                ),
                onPressed: () async {
                  EmailContent email = EmailContent(
                    to: [
                      'info@servicecenter.com',
                    ],
                    //subject: 'Hello!',
                    //body: 'How are you doing?',
                    //cc: ['user2@domain.com', 'user3@domain.com'],
                    //bcc: ['boss@domain.com'],
                  );

                  OpenMailAppResult result =
                      await OpenMailApp.composeNewEmailInMailApp(
                    nativePickerTitle: 'Select email app to compose',
                    emailContent: email,
                  );

                  if (!result.didOpen && !result.canOpen) {
                    showNoMailAppsDialog(context);
                  } else if (!result.didOpen && result.canOpen) {
                    showDialog(
                      context: context,
                      builder: (_) => MailAppPickerDialog(
                        mailApps: result.options,
                        emailContent: email,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Constants.appColorGray,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        color: Constants.appColorBlack.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Constants.appColorGray,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLabel(
                    text: "Call us now!".tr,
                    widgetSize: WidgetSize.medium,
                  ),
                  Text("                                        "),
                ],
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.phone_callback_outlined,
                  color: Constants.appColorGray,
                ),
                label: Text(
                  '076 xxx xxxx',
                  style: TextStyle(
                    fontSize: 18,
                    color: Constants.appColorAmber,
                  ),
                ),
                onPressed: _callNumber,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      imgUrl,
                      width: 210,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
