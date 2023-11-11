class CategoryModel {
  List<Data> data = [];
  CategoryModel.fromJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      data.add(Data.fromJson(element));
    });
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  Data.fromJson(Map<String?, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
}
