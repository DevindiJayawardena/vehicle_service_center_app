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
      required String vehicleNo}) async {
    var data = {
      "first_name": fName,
      "last_name": lName,
      "contact_number": cNo,
      "nic_number": nic,
      "vehicle_type": vehicleType,
      "vehicle_number": vehicleNo
    };

    var header = {"Accept": "application/json", "Authorization": token};
    var url = Uri.https(API_BASE_URL, "/customer/register/$userId");
    return await http.put(url, body: data, headers: header);
  }

  Future<http.Response> customerLoginApi(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };

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

  Future<http.Response> getAllAppointmentApi({required String token}) async {
    var header = {"Accept": "application/json", "Authorization": token};

    var url = Uri.https(API_BASE_URL, "/appointment/getAllAppointments");
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
}
