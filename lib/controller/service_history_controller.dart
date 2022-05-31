import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/controller/network_controller.dart';
import 'package:vehicle_service_center_app/model/service_history.dart';

import '../api_service/api_service.dart';
import '../const/app_colors.dart';
import '../const/custom_snack_bar.dart';
import '../model/vehicles.dart';

class ServiceHistoryController extends GetxController {
  NetworkController networkController = Get.find<NetworkController>();
  var vehicles = Vehicles();
  var serviceHistory = ServiceHistory().obs;
  final userBox = GetStorage('userBox');

  @override
  void onInit() {
    var token = userBox.read('token');
    var id = userBox.read('id');
    vehicleHistory(token, id);
    super.onInit();
  }

  void vehicleHistory(String token, String userId) async {
    try {
      if (networkController.connectionStatus.value != -1) {
        //CustomDialogBox.buildDialogBox();
        var response = await ApiService().getCustomerVehiclesApi(token, userId);
        //Get.back();
        print("car list--------------------->");
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            vehicles = Vehicles.fromJson(decodedData);
            if (vehicles.data!.isNotEmpty)
              vehicleInitialHistory(token, vehicles.data![0].id.toString());
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

  void vehicleInitialHistory(String token, String initVehicleId) async {
    try {
      if (networkController.connectionStatus.value != -1) {
        //CustomDialogBox.buildDialogBox();
        var response = await ApiService()
            .getServiceHistoryApi(token: token, vehicleId: initVehicleId);
        //Get.back();
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            serviceHistory.value = ServiceHistory.fromJson(decodedData);
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
