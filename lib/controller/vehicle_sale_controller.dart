import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_service_center_app/controller/network_controller.dart';
import 'package:vehicle_service_center_app/model/customer_not_sale_vehicle.dart';
import 'package:vehicle_service_center_app/screens/main/home_screen.dart';

import '../api_service/api_service.dart';
import '../const/app_colors.dart';
import '../const/custom_dialog_box.dart';
import '../const/custom_snack_bar.dart';
import '../screens/main/sell_your_vehicle_screen.dart';

class VehicleSaleController extends GetxController {
  CustomerNotSaledVehicle customerVehicle = CustomerNotSaledVehicle();

  NetworkController networkController = Get.find<NetworkController>();

  final userBox = GetStorage('userBox');

  void viewCustomerNoteSaleVehicle() async {
    var token = userBox.read('token');
    var id = userBox.read('id');
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService()
            .viewCustomerNotSaleVehiclesApi(token: token, id: "$id");
        Get.back();
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);
          print("----------------->>>> sale");
          print(decodedData);
          if (decodedData['success']) {
            print("----------------->>>> success");
            customerVehicle = CustomerNotSaledVehicle.fromJson(decodedData);
            Get.to(() => SellYourVehicleScreen(), arguments: [customerVehicle]);
          } else {
            CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: "No vehicle to Sale",
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
            title: "Alert".tr,
            message: "Please Check your Internet".tr,
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.buildSnackBar(
          title: "Alert".tr, message: "Something went wrong".tr);
    }
  }

  void addVehicleAd({
    required String vehicleId,
    required String type,
    required String brand,
    required String model,
    required String manufacDate,
    required String condition,
    required String transmission,
    required String fuelType,
    required String engineCapacity,
    required String Mileage,
    required List<XFile> imagefiles,
    required String sellerName,
    required String city,
    required String price,
    required String contactNo,
  }) async {
    var token = userBox.read('token');
    String base64string = "";
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        if (imagefiles.length != 0) {
          File file = File(imagefiles[0].path);
          Uint8List imageBytes = await file.readAsBytes();
          base64string = base64.encode(imageBytes);
          print("___________________base 64");
          log(base64string);
        }
        var response = await ApiService().addVehicleSales(
            token: token,
            vehicleId: vehicleId,
            type: type,
            brand: brand,
            model: model,
            manufacDate: manufacDate,
            condition: condition,
            transmission: transmission,
            fuelType: fuelType,
            engineCapacity: engineCapacity,
            Mileage: Mileage,
            baseImage: base64string,
            sellerName: sellerName,
            city: city,
            price: price,
            contactNo: contactNo);
        Get.back();
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            print("----------------->>>> success");
            Get.offAll(HomeScreen());
            print(decodedData);
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
            title: "Alert".tr,
            message: "Please Check your Internet".tr,
            bgColor: AppColors.appColorBlack);
      }
    } catch (e) {
      Get.back();
      print("----------------->>>> success");
      print(e);
      CustomSnackBar.buildSnackBar(
          title: "Alert".tr, message: "Something went wrong".tr);
    }
  }
}
