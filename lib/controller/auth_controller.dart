import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/api_service/api_service.dart';
import 'package:vehicle_service_center_app/screens/main/home_screen.dart';

import '../const/app_colors.dart';
import '../const/custom_dialog_box.dart';
import '../const/custom_snack_bar.dart';
import '../screens/main/user_registeration_screen.dart';
import 'network_controller.dart';

class AuthController extends GetxController {
  RxBool isLoginLoading = true.obs;
  NetworkController networkController = Get.find<NetworkController>();
  final userBox = GetStorage('userBox');

  bool hasToken() {
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

  void emailLogin(String email, String password) async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();

        var response =
            await ApiService().customerLoginApi(email, password, fcmToken);
        Get.back();
        print("------------>res");
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);
          if (decodedData['success']) {
            print("ok");
            userBox.write('token', decodedData['token']['token']);
            userBox.write(
                'is_complete', decodedData['token']['sub']['is_completed']);
            userBox.write('id', decodedData['token']['sub']['id']);
            userBox.write('email', decodedData['token']['sub']['email']);
            Get.off(() => HomeScreen());
          } else {
            CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: decodedData['message'],
                bgColor: AppColors.appColorBlack);
          }
        } else {
          CustomSnackBar.buildSnackBar(
              title: "Alert",
              message: "Invalid Response",
              bgColor: AppColors.appColorBlack);
        }
      } else {
        CustomSnackBar.buildSnackBar(
            title: "Connection Error",
            message: "Please Check your Internet",
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      Get.back();
      print("------------>$e");

      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }

  /*void resendEmailVerification(String email) async {
    try {
      if (networkController.connectionStatus.value !=
          -1) {
        CustomDialogBox.buildDialogBox();
        var response = await AuthApiService().resendEmailVerificationApi(email);
        Get.back();

        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);
          if (decodedData['errorMessage'] == null) {
            CustomSnackBar.buildSnackBar(
                title: "Alert", message: "Email Verification Resent");
          } else {
            CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: decodedData['errorMessage'],
                bgColor: AppColors.appColorBlack);
          }
        } else {
          CustomSnackBar.buildSnackBar(
              title: "Alert",
              message: "Invalid Response",
              bgColor: AppColors.appColorBlack);
        }
      } else {
        CustomSnackBar.buildSnackBar(
            title: "Connection Error",
            message: "Please Check your Internet",
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }*/

  void signUp(String email, String password) async {
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService().customerSignUpApi(email, password);
        Get.back();
        var decodedResponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          if (decodedResponse["success"]) {
            userBox.write('token', decodedResponse['tokenObject']['token']);
            userBox.write('is_complete',
                decodedResponse['tokenObject']['sub']['is_completed']);
            userBox.write('id', decodedResponse['tokenObject']['sub']['id']);
            userBox.write(
                'email', decodedResponse['tokenObject']['sub']['email']);

            print('token----------------> ${userBox.read('token')}');
            print('registed----------------> ${userBox.read('is_complete')}');
            print('id----------------> ${userBox.read('id')}');
            print('email----------------> ${userBox.read('email')}');
            Get.off(() => UserRegistrationScreen());
          } else {
            CustomSnackBar.buildSnackBar(
                title: "Alert", message: decodedResponse["message"]);
          }
        } else {
          CustomSnackBar.buildSnackBar(
              title: "Alert",
              message: "Invalid Response",
              bgColor: AppColors.appColorBlack);
        }
      } else {
        CustomSnackBar.buildSnackBar(
            title: "Connection Error",
            message: "Please Check your Internet",
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      print(e.toString());
      CustomSnackBar.buildSnackBar(title: "Alert", message: "$e");
    }
  }

  void userRegister(
      {required String fName,
      required String lName,
      required String cNo,
      required String nic,
      required String vehicleType,
      required String vehicleNo}) async {
    final userBox = GetStorage('userBox');
    var token = userBox.read('token');
    var id = userBox.read('id');

    try {
      if (networkController.connectionStatus.value != -1) {
        String? fcmToken = await FirebaseMessaging.instance.getToken();
        CustomDialogBox.buildDialogBox();
        var response = await ApiService().customerRegisterApi(
            token: token,
            userId: id,
            fName: fName,
            lName: lName,
            nic: nic,
            vehicleType: vehicleType,
            vehicleNo: vehicleNo,
            cNo: cNo,
            fcmToken: fcmToken);
        Get.back();
        print("register response------------------------>");
        print(response.body);
        var decodedResponse = jsonDecode(response.body);
        print("register response------------------------>");
        print(decodedResponse);
        if (response.statusCode == 200) {
          if (decodedResponse["success"]) {
            userBox.write('token', decodedResponse['tokenObject']['token']);
            userBox.write('is_complete',
                decodedResponse['tokenObject']['sub']['is_completed']);
            userBox.write('id', decodedResponse['tokenObject']['sub']['id']);
            userBox.write("fName", fName);
            userBox.write("lName", lName);
            userBox.write("phnNo", cNo);
            userBox.write("nic", nic);

            Get.off(() => HomeScreen());
          } else {
            CustomSnackBar.buildSnackBar(
                title: "Alert", message: decodedResponse["message"]);
          }
        } else {
          CustomSnackBar.buildSnackBar(
              title: "Alert",
              message: "Invalid Response",
              bgColor: AppColors.appColorBlack);
        }
      } else {
        CustomSnackBar.buildSnackBar(
            title: "Connection Error",
            message: "Please Check your Internet",
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      print(e.toString());
      CustomSnackBar.buildSnackBar(title: "Alert", message: "$e");
    }
  }

  void forgotPassword(String email) async {
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        //var response = await AuthApiService().forgotPasswordApi(email);
        Get.back();
        /*var decodedResponse = jsonDecode(response.body);
        print(response.body);
        if (response.statusCode == 200) {
          if (decodedResponse["errorMessage"] == null) {
            //Get.offAllNamed(Routes.LOGIN);
            CustomSnackBar.buildSnackBar(
                title: "Alert", message: decodedResponse["message"]);
          } else {
            CustomSnackBar.buildSnackBar(
                title: "Alert", message: decodedResponse["errorMessage"]);
          }
        } else {
          CustomSnackBar.buildSnackBar(
              title: "Alert",
              message: "Invalid Response",
              bgColor: AppColors.appColorBlack);
        }*/
      } else {
        CustomSnackBar.buildSnackBar(
            title: "Connection Error",
            message: "Please Check your Internet",
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong!");
    }
  }
}
