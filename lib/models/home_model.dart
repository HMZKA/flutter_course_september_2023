class HomeModel {
  bool? status;
  Data? data;
  HomeModel.formJson(Map<String, dynamic> json) {
    status = json["status"];
    data = Data.fromJson(json["data"]);
  }
}

class Data {
  List<Banners> banners = [];
  List<Products> products = [];
  Data.fromJson(Map<String, dynamic> json) {
    json["products"].forEach((element) {
      products.add(Products.fromJson(element));
    });
    json["banners"].forEach((element) {
      banners.add(Banners.fromJson(element));
    });
  }
}

class Banners {
  String? image;
  Banners.fromJson(Map<String, dynamic> json) {
    image = json["image"];
  }
}

class Products {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? name;
  String? image;
  String? description;
  List<String> images = [];
  bool? inFavorite;
  bool? inCart;
  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"].floor();
    oldPrice = json["old_price"].floor();
    discount = json["discount"].floor();
    name = json["name"];
    description = json["description"];
    image = json["image"];
    json["images"].forEach((element) {
      images.add(element);
    });
    inFavorite = json["in_favorite"];
    inCart = json["in_cart"];
  }
}
