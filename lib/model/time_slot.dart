class TimeSlot {
  List<Data>? data;
  String? message;

  TimeSlot({this.data, this.message});

  TimeSlot.fromJson(Map<String, dynamic> json) {
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
  int? start;
  int? end;
  int? numberOfVehicles;

  Data({this.id, this.start, this.end, this.numberOfVehicles});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    end = json['end'];
    numberOfVehicles = json['number_of_vehicles'];
  }
}
