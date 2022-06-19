class ServiceHistory {
  List<Data>? data;

  ServiceHistory({this.data});

  ServiceHistory.fromJson(Map<String, dynamic> json) {
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
  int? isDone;
  int? isPaid;
  String? paymentMethod;
  int? discount;
  dynamic rating;
  int? appointmentId;
  int? employeeId;
  String? createdAt;
  String? status;
  String? date;
  int? vehicleId;
  int? customerId;
  int? timeSlotId;
  int? upgradeTypeId;
  String? userFirstName;
  String? userLastName;
  String? email;
  String? contactNumber;
  String? nicNumber;
  int? isCompleted;
  String? upgradeTypeName;
  String? description;
  int? price;
  int? startTime;
  int? endTime;
  String? vehicleType;
  String? vehicleNumber;

  Data(
      {this.id,
      this.isDone,
      this.isPaid,
      this.paymentMethod,
      this.discount,
      this.rating,
      this.appointmentId,
      this.employeeId,
      this.createdAt,
      this.status,
      this.date,
      this.vehicleId,
      this.customerId,
      this.timeSlotId,
      this.upgradeTypeId,
      this.userFirstName,
      this.userLastName,
      this.email,
      this.contactNumber,
      this.nicNumber,
      this.isCompleted,
      this.upgradeTypeName,
      this.description,
      this.price,
      this.startTime,
      this.endTime,
      this.vehicleType,
      this.vehicleNumber});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDone = json['is_done'];
    isPaid = json['is_paid'];
    paymentMethod = json['payment_method'];
    discount = json['discount'];
    rating = json['rating'];
    appointmentId = json['appointment_id'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    status = json['status'];
    date = json['date'];
    vehicleId = json['vehicle_id'];
    customerId = json['customer_id'];
    timeSlotId = json['time_slot_id'];
    upgradeTypeId = json['upgrade_type_id'];
    userFirstName = json['user_first_name'];
    userLastName = json['user_last_name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    nicNumber = json['nic_number'];
    isCompleted = json['is_completed'];
    upgradeTypeName = json['upgrade_type_name'];
    description = json['description'];
    price = json['price'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    vehicleType = json['vehicle_type'];
    vehicleNumber = json['vehicle_number'];
  }
}
