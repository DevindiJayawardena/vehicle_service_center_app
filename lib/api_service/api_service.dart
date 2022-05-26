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
}
