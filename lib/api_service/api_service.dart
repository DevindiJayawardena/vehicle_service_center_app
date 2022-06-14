import 'package:http/http.dart' as http;

class ApiService {
  static String API_BASE_URL = "vscapp.herokuapp.com";

  /*Future<http.Response> loginWithEmailApi(String email, String password) async {
    var data = {'email': email, 'password': password};
    var header = {"Accept": "application/json"};
    var url = Uri.https(API_BASE_URL, "/api/customer/login");
    return await http.post(url, body: data, headers: header);
  }*/

  Future<http.Response> customerSignUpApi(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };

    var header = {"Accept": "application/json"};
    var url = Uri.https(API_BASE_URL, "/customer/signUp");
    return await http.post(url, body: data, headers: header);
  }

  Future<http.Response> customerRegisterApi(
      {required String token,
      required int userId,
      required String fName,
      required String lName,
      required String cNo,
      required String nic,
      required String vehicleType,
      required String vehicleNo,
      String? fcmToken}) async {
    print(
        "fcm token register ------------------------------------------------->$fcmToken");
    print("fcm------------------------------------------------->$token");
    print("userId ------------------------------------------------->$userId");

    var data = {
      "first_name": fName,
      "last_name": lName,
      "contact_number": cNo,
      "nic_number": nic,
      "vehicle_type": vehicleType,
      "vehicle_number": vehicleNo,
      "fcm_token": fcmToken
    };

    print(data);

    var header = {"Accept": "application/json", "Authorization": token};
    var url = Uri.https(API_BASE_URL, "/customer/register/$userId");
    return await http.put(url, body: data, headers: header);
  }

  Future<http.Response> customerLoginApi(
      String email, String password, String? fcmToken) async {
    print("--------------> fcm token login  $fcmToken");
    var data = {"email": email, "password": password, "fcm_token": fcmToken};

    var header = {"Accept": "application/json"};
    var url = Uri.https(API_BASE_URL, "/customer/login");
    return await http.post(url, body: data, headers: header);
  }

  Future<http.Response> getCustomerVehiclesApi(
      String token, String userId) async {
    var header = {"Accept": "application/json", "Authorization": token};
    var url =
        Uri.https(API_BASE_URL, "/vehicle/getVehiclesByCustomerId/$userId");
    var response = await http.get(url, headers: header);
    //Vehicles vehicles = Vehicles.fromJson(jsonDecode(response.body));
    //print(response.body);
    return response;
  }

  Future<http.Response> getUpgradeTypesApi(String token) async {
    var header = {"Accept": "application/json", "Authorization": token};
    var url = Uri.https(API_BASE_URL, "/upgrade_type/getAllUpgradeTypes");
    var response = await http.get(url, headers: header);
    /*UpgradeTypes upgradeTypes =
        UpgradeTypes.fromJson(jsonDecode(response.body));
    print(response.body);*/
    return response;
  }

  Future<http.Response> getTimeSlotApi(String token) async {
    var header = {"Accept": "application/json", "Authorization": token};
    var url = Uri.https(API_BASE_URL, "/time_slot/getAllTimeSlots");
    var response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> createAppointmentApi(
      {required String token,
      required String vehicleId,
      required String upgradeTypeId,
      required String timeSlotId,
      required String date}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var data = {
      "date": date,
      "time_slot_id": timeSlotId,
      "vehicle_id": vehicleId,
      "upgrade_type_id": upgradeTypeId
    };

    var url = Uri.https(API_BASE_URL, "/appointment/create");
    var response = await http.post(url, headers: header, body: data);
    return response;
  }

  Future<http.Response> updateAppointmentApi(
      {required String token,
      required String appointmentId,
      required String vehicleId,
      required String upgradeTypeId,
      required String timeSlotId,
      required String date}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var data = {
      "date": date,
      "time_slot_id": timeSlotId,
      "vehicle_id": vehicleId,
      "upgrade_type_id": upgradeTypeId
    };

    var url = Uri.https(API_BASE_URL, "/appointment/update/$appointmentId");
    var response = await http.put(url, headers: header, body: data);
    return response;
  }

  Future<http.Response> getAllAppointmentApi(
      {required String token, required String custId}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url =
        Uri.https(API_BASE_URL, "/appointment/getAppointmentById/$custId");
    var response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> deleteAppointmentApi(
      {required String token, required String appointmentId}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url = Uri.https(API_BASE_URL, "/appointment/delete/$appointmentId");
    var response = await http.delete(url, headers: header);
    return response;
  }

  Future<http.Response> getServiceHistoryApi(
      {required String token, required String vehicleId}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url =
        Uri.https(API_BASE_URL, "/service/getHistoryByVehicleId/$vehicleId");
    var response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> updateCustomerProfileApi(
      {required String token,
      required String customerId,
      required String fName,
      required String lName,
      required String email,
      required String phnNo,
      required String nic,
      required String password}) async {
    var header = {"Accept": "application/json", "Authorization": token};
    var data = {
      "first_name": fName,
      "last_name": lName,
      "email": email,
      "password": password,
      "contact_number": phnNo,
      "nic_number": nic,
    };
    var url = Uri.https(API_BASE_URL, "/customer/update/$customerId");
    var response = await http.put(url, headers: header, body: data);
    return response;
  }

  Future<http.Response> viewCustomerVehiclesApi(
      {required String token, required String id}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url = Uri.https(API_BASE_URL, "/vehicle/getVehiclesByCustomerId/$id");
    var response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> addNewVehicle(
      {required String token,
      required String vehicleType,
      required String vehicleNo}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var data = {"vehicle_type": vehicleType, "vehicle_number": vehicleNo};

    var url = Uri.https(API_BASE_URL, "/vehicle/create/");
    var response = await http.post(url, headers: header, body: data);

    return response;
  }

  Future<http.Response> getVehicleHistoryById(
      {required String token, required String vehicleNo}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url =
        Uri.https(API_BASE_URL, "/service/getHistoryByVehicleId/$vehicleNo");
    var response = await http.get(url, headers: header);

    return response;
  }

  Future<http.Response> addVehicleSales({
    required String token,
    required vehicleId,
    required String type,
    required String brand,
    required String model,
    required String manufacDate,
    required String condition,
    required String transmission,
    required String fuelType,
    required String engineCapacity,
    required String Mileage,
    required String baseImage,
    required String sellerName,
    required String city,
    required String price,
    required String contactNo,
  }) async {
    var header = {"Accept": "application/json", "Authorization": token};
    /*List<String> imgList = [];
    imgList.add(baseImage);

    var json = jsonEncode(imgList);*/

    print("------------------------>$token");
    print("------------------------>$vehicleId");

    var data = {
      "vehicle_id": vehicleId,
      "brand": brand,
      "model": model,
      "manufactured_year": manufacDate,
      "vehicle_condition": condition,
      "transmission": transmission,
      "fuel_type": fuelType,
      "engine_capacity": engineCapacity,
      "mileage": Mileage,
      "seller_name": sellerName,
      "city": city,
      "price": price,
      "contact_number": contactNo,
      "thumbnail": baseImage
    };
    var url = Uri.https(API_BASE_URL, "/advertisement/create/");
    var response = await http.post(url, headers: header, body: data);

    return response;
  }

  Future<http.Response> getImageCarousels({
    required String token,
  }) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url = Uri.https(API_BASE_URL, "/carousel/getAllCarousels/");
    var response = await http.get(url, headers: header);

    return response;
  }

  Future<http.Response> getAllSaleVehicles({
    required String token,
  }) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url = Uri.https(API_BASE_URL, "/advertisement/getAllAdvertisements/");
    var response = await http.get(url, headers: header);

    return response;
  }

  Future<http.Response> addRate({
    required String token,
    required String rate,
    required String serviceId,
  }) async {
    print("------------------->RATE$rate");
    print("------------------->token$token");
    print("------------------->si$serviceId");
    var header = {"Accept": "application/json", "Authorization": token};
    var data = {"rating": rate};
    var url = Uri.https(API_BASE_URL, "/service/addRating/$serviceId");
    var response = await http.put(url, headers: header, body: data);

    return response;
  }

  Future<http.Response> submitPayment({
    required String token,
    required String total,
    required String paymentType,
    required String serviceId,
  }) async {
    var header = {"Accept": "application/json", "Authorization": token};
    var data = {"price": total, "payment_method": paymentType};
    var url = Uri.https(API_BASE_URL, "/service/pay/$serviceId");
    var response = await http.put(url, headers: header, body: data);

    return response;
  }

  Future<http.Response> addCashPayment({
    required String token,
    required String serviceId,
  }) async {
    var header = {"Accept": "application/json", "Authorization": token};
    var url = Uri.https(API_BASE_URL, "/service/cashPaymentMethod/$serviceId");
    var response = await http.get(url, headers: header);

    return response;
  }
}
