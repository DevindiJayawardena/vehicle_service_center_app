import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/const/custom_snack_bar.dart';
import 'package:vehicle_service_center_app/controller/profile_controller.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/containers/drawer.dart';

class UpdatePersonalInfoTemplate extends StatelessWidget {
  UpdatePersonalInfoTemplate({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile Info"),
        backgroundColor: Constants.appColorAmber,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: fNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "First Name",
                  hintText: "First Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: lNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Last Name",
                  hintText: "Last Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Email",
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: phnController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Contact No.",
                  hintText: "Contact No.",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nicController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "NIC",
                  hintText: "NIC",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: rePasswordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Re-enter password",
                  hintText: "Re-enter password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FilledRoundedButton(
                  text: "Update",
                  color: Constants.appColorAmberDark,
                  widgetSize: WidgetSize.maxSize,
                  clickEvent: () {
                    print(fNameController.text);
                    print(lNameController.text);
                    print(emailController.text);
                    print(phnController.text);
                    print(nicController.text);
                    print(passwordController.text);
                    print(rePasswordController.text);
                    if (passwordController.text == rePasswordController.text) {
                      profileController.updateProfileDetails(
                          fName: fNameController.text,
                          lName: lNameController.text,
                          email: emailController.text,
                          phnNo: phnController.text,
                          nic: nicController.text,
                          password: passwordController.text);
                    } else {
                      CustomSnackBar.buildSnackBar(
                          title: "alert",
                          message: "Please check your password");
                    }
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
