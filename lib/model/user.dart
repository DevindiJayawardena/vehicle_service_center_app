class User {
  String? token;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? isCompleted;
  String? status;

  User(
      {this.token,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.isCompleted,
      this.status});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isCompleted = json['is_completed'];
    status = json['status'];
  }
}
