import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_service_center_app/screens/main/home_screen.dart';

import '../api_service/api_service.dart';
import '../const/app_colors.dart';
import '../const/custom_dialog_box.dart';
import '../const/custom_snack_bar.dart';
import 'network_controller.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;
  final myBill = GetStorage('myBills');
  final userBox = GetStorage('userBox');
  NetworkController networkController = Get.find<NetworkController>();

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          applePay: true,
          googlePay: true,
          testEnv: true,
          merchantCountryCode: 'US',
          merchantDisplayName: 'Prospects',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await submitPay();
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51L9vGtKuBDskEPplDVJ2sTUbhb6KGDA29aQg7e9P9K6NGYcitztn7ToAxWRQHVsKtUTEn3A7QzDvP8cMynUN1phv00vwL2D2uY',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print("---------------->payment response");
      print(response.body);
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  Future submitPay() async {
    var token = userBox.read("token");
    var total = myBill.read("total");
    var serviceId = myBill.read("serviceId");
    try {
      if (networkController.connectionStatus.value != -1) {
        print("payment token--------------------->$token");
        print("payment total--------------------->$total");
        print("payment serviceid--------------------->$serviceId");
        CustomDialogBox.buildDialogBox();
        var response = await ApiService().submitPayment(
            token: token,
            total: total,
            paymentType: "Card Payment",
            serviceId: serviceId);
        Get.back();
        print("payment body--------------------->");
        print(response.body);
        if (response.statusCode == 200) {
          myBill.erase();
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            print("payment success--------------------->");
            print(decodedData);
            Get.offAll(HomeScreen());
            Get.snackbar('Payment', 'Payment Successful',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.black,
                colorText: Colors.white,
                margin: const EdgeInsets.all(10),
                duration: const Duration(seconds: 3));
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
      print(e);
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }

  void addRate({
    required String rate,
  }) async {
    var token = userBox.read('token');
    var serviceId = myBill.read("serviceId");
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService()
            .addRate(token: token, rate: rate, serviceId: serviceId);
        Get.back();
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
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
      print("----------------->>>> success");
      print(e);
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }

  void addCashPayment() async {
    var token = userBox.read('token');
    var serviceId = myBill.read("serviceId");
    try {
      if (networkController.connectionStatus.value != -1) {
        CustomDialogBox.buildDialogBox();
        var response = await ApiService()
            .addCashPayment(token: token, serviceId: serviceId);
        Get.back();
        print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);

          if (decodedData['success']) {
            myBill.erase();
            Get.offAll(HomeScreen());
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
      print("----------------->>>> success");
      print(e);
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }
}
