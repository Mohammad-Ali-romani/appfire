import 'package:appfire/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    print("build home");
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeController>(builder: (controller) {
        print("builder HomeController");
        return controller.products!.isEmpty
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: controller.getProduct,
                child: ListView(
                  children: controller.products!
                      .map((product) => InkWell(
                            onTap: () {
                              controller.updateProduct(product.id);
                            },
                            child: Card(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(),
                                  Text(product.description),
                                  Text(product.createDate),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              );
      }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: controller.addProduct, label: Text("add Product")),
    );
  }
}
