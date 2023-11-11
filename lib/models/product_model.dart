import 'package:flutter_application_course/models/home_model.dart';

class ProductModel {
  List<Products> products = [];
  ProductModel.fromJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      products.add(Products.fromJson(element));
    });
  }
}
