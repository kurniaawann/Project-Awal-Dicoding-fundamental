import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  var restaurants = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurantsList();
  }

  Future<void> fetchRestaurantsList() async {
    try {
      final url = Uri.parse('https://restaurant-api.dicoding.dev/list');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Map<String, dynamic>> restaurantList =
            List<Map<String, dynamic>>.from(data['restaurants']);
        restaurants.assignAll(restaurantList);
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      Get.snackbar(
          "Terjadi Kesalahan", "Terjadi Kesalahan Saat Mengambil Data");
    }
  }
}
