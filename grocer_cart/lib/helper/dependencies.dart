import 'package:get/get.dart';
import 'package:grocer_cart/controllers/popular_product_controller.dart';
import 'package:grocer_cart/data/repository/popular_product_repo.dart';
import '../data/api/api_client.dart';
import '../utils/app_constants.dart';
Future<void> init()async {
  //api client

  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));

  //repos
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
}