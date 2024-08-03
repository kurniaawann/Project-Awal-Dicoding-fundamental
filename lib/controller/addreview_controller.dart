import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  var reviewResult = {}.obs;

  Future<void> addReview(
      String restaurantId, String name, String review) async {
    try {
      final url = Uri.parse('https://restaurant-api.dicoding.dev/review');
      final headers = {'Content-Type': 'application/json'};
      final body =
          json.encode({'id': restaurantId, 'name': name, 'review': review});

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        reviewResult.value = data;
      } else {
        throw Exception('Failed to add review');
      }
    } catch (e) {
      Get.snackbar(
          "Terjadi Kesalahan", "Terjadi Kesalahan Saat Menambahkan Review");
    }
  }
}
