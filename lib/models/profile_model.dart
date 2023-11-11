class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? token;
  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    token = json["token"];
  }
}
