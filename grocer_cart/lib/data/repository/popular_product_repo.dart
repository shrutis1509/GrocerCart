import 'package:get/get.dart';
import 'package:grocer_cart/data/api/api_client.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({ required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("end point url");
  }
}
