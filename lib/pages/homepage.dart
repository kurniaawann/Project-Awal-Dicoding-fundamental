import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restaurant_app_api/routes/route_name.dart';
import '../controller/list_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Future<void> checkInternetConnection() async {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {
        Get.snackbar(
            "Terjadi Kesalahan", "Harap Nyalakan Koneksi Internet Anda");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant List"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteName.search);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: GetX<RestaurantController>(
        init: RestaurantController(),
        builder: (controller) {
          checkInternetConnection();
          if (controller.restaurants.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = controller.restaurants[index];
                final imageUrl =
                    'https://restaurant-api.dicoding.dev/images/large/${restaurant['pictureId']}';

                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      RouteName.detailInformasi,
                      arguments: restaurant['id'],
                    );
                  },
                  child: Card(
                    shadowColor: Colors.blue,
                    borderOnForeground: false,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(20),
                      title: Text(
                        restaurant['name'],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            restaurant['description'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.location_on_rounded,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                restaurant['city'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      leading: Image.network(
                        imageUrl,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16.0,
                          ),
                          Text(
                            restaurant['rating'].toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
