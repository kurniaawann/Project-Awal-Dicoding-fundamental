import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/controller/search_controller.dart';
import './routes/page_route.dart';
import 'package:restaurant_app_api/routes/route_name.dart';

void main() {
  runApp(const MyApp());
  Get.put(RestaurantControllerSearch());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Myroute.pages,
      initialRoute: RouteName.homePage,
    );
  }
}
