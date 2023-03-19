import 'package:get/get.dart';
import 'package:grocer_cart/controllers/popular_product_controller.dart';
import 'package:grocer_cart/data/repository/popular_product_repo.dart';
import '../data/api/api_client.dart';
Future<void> init()async {
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:"end point url"));

  //repos
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
}