import 'dart:convert';

import 'package:appfire/models/product.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Product>? products = [];
  Dio? api;
  @override
  void onInit() {
    api = Dio(BaseOptions(
        baseUrl: "https://new-app-fireb-default-rtdb.firebaseio.com/",
        headers: {"accept": "application/json"}));
    getProduct();
    super.onInit();
  }

  void addProduct() {
    api?.post("product.json", data: {
      "name": "my name",
      "description": "this is the product",
      "createDate": DateTime.now().toString()
    });
  }

  Future<void> getProduct() async {
    var response = await api?.get("product.json");
    Map data = response!.data;
    List<Product> datas = [];
    data.forEach((key, value) {
      datas.add(Product(
          id: key,
          name: value['name'] ?? "",
          description: value['description'] ?? "",
          createDate: value['createDate'] ?? ""));
    });
    products = datas;
    update();
  }

  void updateProduct(id) {
    api!.patch("product/$id.json",data: {
      "name": "update name",
      "description": "update description",
      "createDate": DateTime.now().toString()
    });
  }
}
