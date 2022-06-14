import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/screens/main/home_screen.dart';

import '../api_service/api_service.dart';
import '../const/app_colors.dart';
import '../const/custom_dialog_box.dart';
import '../const/custom_snack_bar.dart';
import '../model/custmer_vehicle.dart';
import '../screens/main/view_vehicles_screen.dart';
import 'network_controller.dart';

class ProfileController extends GetxController {
  NetworkController networkController = Get.find<NetworkController>();
  final userBox = GetStorage('userBox');

  void updateProfileDetails(
      {required String fName,
      required String lName,
      required String email,
      required String phnNo,
      required String nic,
      required String password}) async {
    var token = userBox.read('token');
    var id = userBox.read('id');
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService().updateCustomerProfileApi(
            token: token,
            customerId: id,
            fName: fName,
            lName: lName,
            email: email,
            phnNo: phnNo,
            nic: nic,
            password: password);
        Get.back();
        print("profile--------------------->");
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);
          print(decodedData);
          if (decodedData['success']) {
            userBox.write("fName", fName);
            userBox.write("lName", lName);
            userBox.write("phnNo", phnNo);
            userBox.write("nic", nic);
            userBox.write("email", email);
            Get.offAll(() => HomeScreen());
            CustomSnackBar.buildSnackBar(
                title: "Success", message: decodedData['message']);
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
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }

  void viewOrAddVehicle() async {
    var token = userBox.read('token');
    var id = userBox.read('id');
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response =
            await ApiService().viewCustomerVehiclesApi(token: token, id: id);
        Get.back();
        print("cust vehicle--------------------->");
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            CustomerVehicle customerVehicle =
                CustomerVehicle.fromJson(decodedData);
            Get.to(() => ViewVehiclesScreen(), arguments: [customerVehicle]);
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
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }

  void addNewVehicle(
      {required String vehicleType, required String vehicleNumber}) async {
    var token = userBox.read('token');
    var id = userBox.read('id');
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService().addNewVehicle(
            token: token, vehicleType: vehicleType, vehicleNo: vehicleNumber);
        Get.back();
        print("add vehicle--------------------->");
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);
          print(decodedData);
          if (decodedData['success']) {
            Get.to(() => HomeScreen());
            CustomSnackBar.buildSnackBar(
                title: "Alert", message: decodedData["message"]);
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
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }
}
