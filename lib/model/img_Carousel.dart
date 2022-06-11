class ImageCarousel {
  String? message;
  List<Data>? data;

  ImageCarousel({this.message, this.data});

  ImageCarousel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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
  String? image;

  Data({this.id, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
