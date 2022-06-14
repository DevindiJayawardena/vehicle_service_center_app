import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/const/base_64_conver.dart';
import 'package:vehicle_service_center_app/model/img_Carousel.dart';
import 'package:vehicle_service_center_app/model/sale_vehicle.dart';
import 'package:vehicle_service_center_app/model/time_slot.dart';
import 'package:vehicle_service_center_app/model/upgrade_types.dart';
import 'package:vehicle_service_center_app/model/vehicles.dart';
import 'package:vehicle_service_center_app/screens/main/add_appointment_screen.dart';
import 'package:vehicle_service_center_app/screens/main/home_screen.dart';
import 'package:vehicle_service_center_app/screens/main/view_appointment_screen.dart';

import '../api_service/api_service.dart';
import '../const/app_colors.dart';
import '../const/custom_dialog_box.dart';
import '../const/custom_snack_bar.dart';
import '../model/appointment.dart';
import 'network_controller.dart';

class AppointmentController extends GetxController {
  var isAppointmentDataLoading = false.obs;
  Vehicles vehicles = Vehicles();
  UpgradeTypes upgradeTypes = UpgradeTypes();
  TimeSlot timeSlot = TimeSlot();
  Appointment appointment = Appointment();
  NetworkController networkController = Get.find<NetworkController>();
  final userBox = GetStorage('userBox');
  List<dynamic> imgList = [];
  SaleVehicle saleVehicle = SaleVehicle();

  @override
  void onInit() {
    super.onInit();
  }

  void addAppointment(
      {required String token,
      required String id,
      required bool isEdit,
      String? appointmentId}) async {
    print(token);
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var vehicleResponse =
            await ApiService().getCustomerVehiclesApi(token, id);
        var upgradeResponse = await ApiService().getUpgradeTypesApi(token);
        var timeSlotResponse = await ApiService().getTimeSlotApi(token);
        Get.back();
        print(upgradeResponse.body);
        if (vehicleResponse.statusCode == 200 &&
            upgradeResponse.statusCode == 200 &&
            timeSlotResponse.statusCode == 200) {
          Map<String, dynamic> vehicleDecodedData =
              jsonDecode(vehicleResponse.body);

          vehicles = Vehicles.fromJson(vehicleDecodedData);

          Map<String, dynamic> upgradeDecodedData =
              jsonDecode(upgradeResponse.body);

          upgradeTypes = UpgradeTypes.fromJson(upgradeDecodedData);

          Map<String, dynamic> timeSlotDecodedData =
              jsonDecode(timeSlotResponse.body);

          timeSlot = TimeSlot.fromJson(timeSlotDecodedData);

          if (vehicleDecodedData['success'] &&
              upgradeDecodedData['success'] &&
              timeSlotDecodedData['success']) {
            Get.to(() => AddAppointmentScreen(
                  isEdit: isEdit,
                  appointmentId: appointmentId,
                ));
          } else {
            CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: vehicleDecodedData['message'],
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

  void createAppointment(String token, String vehicleId, String upgradeTypeId,
      String timeSlotId, String date) async {
    print('-------------->token $token');
    print('-------------->vid $vehicleId');
    print('-------------->uti $upgradeTypeId');
    print('-------------->tsi $timeSlotId');
    print('-------------->date $date');
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService().createAppointmentApi(
            token: token,
            vehicleId: vehicleId,
            upgradeTypeId: upgradeTypeId,
            timeSlotId: timeSlotId,
            date: date);
        Get.back();
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            print('success');
            print(decodedData);
            Get.off(() => HomeScreen());
            CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: decodedData['message'],
                bgColor: AppColors.appColorBlack);
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

  void updateAppointment(String token, String appointmentId, String vehicleId,
      String upgradeTypeId, String timeSlotId, String date) async {
    print("------->appointment id");
    print(appointmentId);
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService().updateAppointmentApi(
            token: token,
            appointmentId: appointmentId,
            vehicleId: vehicleId,
            upgradeTypeId: upgradeTypeId,
            timeSlotId: timeSlotId,
            date: date);
        Get.offAll(() => HomeScreen());
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            print('success');
            print(decodedData);
            Get.off(() => HomeScreen());
            CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: decodedData['message'],
                bgColor: AppColors.appColorBlack);
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

  void getAllAppointment(String token, String custId) async {
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService()
            .getAllAppointmentApi(token: token, custId: custId);
        Get.back();
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            appointment = Appointment.fromJson(decodedData);
            Get.to(() => ViewAppointmentScreen());
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

  void deleteAppointment(String token, String appointmentId) async {
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService()
            .deleteAppointmentApi(token: token, appointmentId: appointmentId);
        Get.back();
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            appointment = Appointment.fromJson(decodedData);
            Get.off(() => HomeScreen());
            CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: decodedData['message'],
                bgColor: AppColors.appColorBlack);
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

  Future getAllCarousels() async {
    var token = userBox.read('token');
    if (networkController.connectionStatus.value != -1) {
      var response = await ApiService().getImageCarousels(token: token);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);

        if (decodedData['success']) {
          print("------------------>response image");
          ImageCarousel imageCarousels = ImageCarousel.fromJson(decodedData);
          imageCarousels.data?.forEach((element) async {
            final _byteImage =
                Base64Convertor.base64StringToBite(element.image!);
            imgList.add(_byteImage);
          });
        } else {
          print("_________________________>carousel data not found");
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
  }

  Future getAllSaleVehicles() async {
    try {
      var token = userBox.read('token');
      if (networkController.connectionStatus.value != -1) {
        var response = await ApiService().getAllSaleVehicles(token: token);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);
          print("------------------>sale vehicles");
          print(response.body);
          if (decodedData['success']) {
            print(response.body);
            saleVehicle = SaleVehicle.fromJson(decodedData);
          } else {
            print(decodedData['message']);
            /*CustomSnackBar.buildSnackBar(
                title: "Alert",
                message: decodedData['message'],
                bgColor: AppColors.appColorBlack);*/
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
      print("-------------------------->");
      print(e);
    }
  }
}
