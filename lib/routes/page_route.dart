import 'package:get/get.dart';
import 'package:restaurant_app_api/pages/customer_review.dart';
import 'package:restaurant_app_api/pages/detail.dart';
import 'package:restaurant_app_api/pages/homepage.dart';
import 'package:restaurant_app_api/pages/search.dart';
import 'package:restaurant_app_api/routes/route_name.dart';

class Myroute {
  static final pages = [
    GetPage(
      name: RouteName.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteName.detailInformasi,
      page: () => DetailInformasi(),
    ),
    GetPage(
      name: RouteName.customerReview,
      page: () => const CustomerReview(),
    ),
    GetPage(
      name: RouteName.search,
      page: () => const Search(),
    ),
  ];
}
