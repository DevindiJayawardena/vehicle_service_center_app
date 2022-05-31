class Appointment {
  List<Data>? data;
  String? message;

  Appointment({this.data, this.message});

  Appointment.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  String? status;
  String? date;
  int? vehicleId;
  int? customerId;
  int? timeSlotId;
  int? upgradeTypeId;
  String? upgradeTypeName;
  String? description;
  int? price;
  int? startTime;
  int? endTime;
  String? vehicleType;
  String? vehicleNumber;
  String? createdAt;
  String? userFirstName;
  String? userLastName;
  String? email;
  String? contactNumber;
  String? nicNumber;
  int? isCompleted;

  Data(
      {this.id,
      this.status,
      this.date,
      this.vehicleId,
      this.customerId,
      this.timeSlotId,
      this.upgradeTypeId,
      this.upgradeTypeName,
      this.description,
      this.price,
      this.startTime,
      this.endTime,
      this.vehicleType,
      this.vehicleNumber,
      this.createdAt,
      this.userFirstName,
      this.userLastName,
      this.email,
      this.contactNumber,
      this.nicNumber,
      this.isCompleted});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    date = json['date'];
    vehicleId = json['vehicle_id'];
    customerId = json['customer_id'];
    timeSlotId = json['time_slot_id'];
    upgradeTypeId = json['upgrade_type_id'];
    upgradeTypeName = json['upgrade_type_name'];
    description = json['description'];
    price = json['price'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    vehicleType = json['vehicle_type'];
    vehicleNumber = json['vehicle_number'];
    createdAt = json['created_at'];
    userFirstName = json['user_first_name'];
    userLastName = json['user_last_name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    nicNumber = json['nic_number'];
    isCompleted = json['is_completed'];
  }
}
