class CustomerVehicle {
  List<Data>? data;

  CustomerVehicle({this.data});

  CustomerVehicle.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  String? nicNumber;
  int? isCompleted;

  Data(
      {this.id,
      this.customerId,
      this.vehicleType,
      this.vehicleNumber,
      this.firstName,
      this.lastName,
      this.email,
      this.contactNumber,
      this.nicNumber,
      this.isCompleted});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    vehicleType = json['vehicle_type'];
    vehicleNumber = json['vehicle_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    nicNumber = json['nic_number'];
    isCompleted = json['is_completed'];
  }
}
