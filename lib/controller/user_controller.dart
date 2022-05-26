import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'network_controller.dart';

class UserController extends GetxController {
  //var user = User().obs;
  final userBox = GetStorage('userBox');
  List<int> favItemList = [];
  NetworkController networkController = Get.find<NetworkController>();

  @override
  void onInit() {
    /*user.value = getUser();
    getAllFavorites();
    ever(user, (_) {
      saveUser();
    });*/
    super.onInit();
  }

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

  /*void saveUser() {
    user.value.toJson().forEach((key, value) {
      userBox.write(key, value);
    });
  }*/

  /*User getUser() {
    User user = User(
      token: userBox.read('token'),
      id: userBox.read('id'),
      sourceId: userBox.read('source_id'),
      destinationId: userBox.read('destination_id'),
      source: userBox.read('source'),
      email: userBox.read('email'),
      firstName: userBox.read('first_name'),
      lastName: userBox.read('last_name'),
      phone: userBox.read('phone'),
      currency: userBox.read('currency'),
      address1: userBox.read('address1'),
      address2: userBox.read('address2'),
      city: userBox.read('city'),
      zip: userBox.read('zip'),
      provinceCode: userBox.read('province_code'),
      province: userBox.read('province'),
      countryCode: userBox.read('country_code'),
      country: userBox.read('country'),
      deletedAt: userBox.read('deleted_at'),
      createdAt: userBox.read('created_at'),
      updatedAt: userBox.read('updated_at'),
      profileImage: userBox.read('profile_image'),
      emailVerifiedAt: userBox.read('email_verified_at'),
    );

    return user;
  }*/

  /*void updateUserProfile(String name) {
    //to call ever
    var newUser = getUser();
    newUser.firstName = name;
    user.value = newUser;
  }*/

  /*void logoutUser() async {
    try {
      CustomDialogBox.buildDialogBox();
      print("bearer token ------>${user.value.token!}");
      var response = await AuthApiService().userLogoutApi(user.value.token!);
      Get.back();

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        if (decodedData['errorMessage'] == null) {
          userBox.erase();
          user.value = User();
          Get.offAllNamed(Routes.LOGIN);
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
    } catch (e) {
      Get.back();
      print(e);
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }*/

  /*void uploadUserProfile(
      {required String token,
      required fName,
      required lName,
      required phone}) async {
    try {
      CustomDialogBox.buildDialogBox();

      var response = await AuthApiService().uploadUserProfileApi(
          token: token, fName: fName, lName: lName, phone: phone);
      Get.back();
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        if (decodedData['errorMessage'] == null) {
          var newUser = getUser();
          newUser.firstName = decodedData["data"]["first_name"];
          newUser.lastName = decodedData["data"]["last_name"];
          newUser.phone = decodedData["data"]["phone"];
          user.value = newUser;
          Get.offAllNamed(Routes.DASHBOARD_SCREEN);
          CustomSnackBar.buildSnackBar(
              title: "Alert", message: decodedData["message"]);
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
    } catch (e) {
      Get.back();
      print(e);
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }*/

  /*Future<void> uploadUserProfilePicture({
    required String token,
    required String baseImg,
  }) async {
    try {
      var response = await AuthApiService()
          .uploadUserProfilePictureApi(token: token, baseImg: baseImg);

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        if (decodedData['errorMessage'] == null) {
          print(decodedData["data"]["profile_image"]);
          var newUser = getUser();
          newUser.profileImage = decodedData["data"]["profile_image"];
          user.value = newUser;
          CustomSnackBar.buildSnackBar(
              title: "Alert", message: decodedData["message"]);
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
    } catch (e) {
      Get.back();
      print(e);
      CustomSnackBar.buildSnackBar(
          title: "Alert", message: "Something went wrong");
    }
  }*/

}
