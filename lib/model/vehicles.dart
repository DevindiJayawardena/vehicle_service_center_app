class Vehicles {
  List<Data>? data;

  Vehicles({this.data});

  Vehicles.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  int? customerId;
  String? vehicleType;
  String? vehicleNumber;

  Data({this.id, this.customerId, this.vehicleType, this.vehicleNumber});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    vehicleType = json['vehicle_type'];
    vehicleNumber = json['vehicle_number'];
  }
}
