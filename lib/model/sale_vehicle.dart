class SaleVehicle {
  int? code;
  bool? success;
  List<Data>? data;
  String? message;

  SaleVehicle({this.code, this.success, this.data, this.message});

  SaleVehicle.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  int? id;
  int? vehicleId;
  String? brand;
  String? model;
  String? manufacturedYear;
  String? vehicleCondition;
  String? transmission;
  String? fuelType;
  String? engineCapacity;
  String? mileage;
  String? sellerName;
  String? city;
  int? price;
  String? contactNumber;
  String? thumbnail;
  int? isSold;
  String? createdAt;
  int? customerId;
  String? vehicleType;
  String? vehicleNumber;
  String? firstName;
  String? lastName;
  String? email;

  Data(
      {this.id,
      this.vehicleId,
      this.brand,
      this.model,
      this.manufacturedYear,
      this.vehicleCondition,
      this.transmission,
      this.fuelType,
      this.engineCapacity,
      this.mileage,
      this.sellerName,
      this.city,
      this.price,
      this.contactNumber,
      this.thumbnail,
      this.isSold,
      this.createdAt,
      this.customerId,
      this.vehicleType,
      this.vehicleNumber,
      this.firstName,
      this.lastName,
      this.email});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleId = json['vehicle_id'];
    brand = json['brand'];
    model = json['model'];
    manufacturedYear = json['manufactured_year'];
    vehicleCondition = json['vehicle_condition'];
    transmission = json['transmission'];
    fuelType = json['fuel_type'];
    engineCapacity = json['engine_capacity'];
    mileage = json['mileage'];
    sellerName = json['seller_name'];
    city = json['city'];
    price = json['price'];
    contactNumber = json['contact_number'];
    thumbnail = json['thumbnail'];
    isSold = json['is_sold'];
    createdAt = json['created_at'];
    customerId = json['customer_id'];
    vehicleType = json['vehicle_type'];
    vehicleNumber = json['vehicle_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }
}
