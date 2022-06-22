class CustomerNotSaledVehicle {
  int? code;
  bool? success;
  List<Data>? data;
  String? message;

  CustomerNotSaledVehicle({this.code, this.success, this.data, this.message});

  CustomerNotSaledVehicle.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['vehicle_type'] = this.vehicleType;
    data['vehicle_number'] = this.vehicleNumber;
    return data;
  }
}
