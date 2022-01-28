import 'package:appfire/bindings/homeBindings.dart';
import 'package:appfire/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: "/",
          page: () => Home(),
          // binding: HomeBinding(),
        )
      ],
    );
  }
}
