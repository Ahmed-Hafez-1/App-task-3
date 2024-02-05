import "package:dio/dio.dart" show Dio;
import 'package:flutter_application_1/pro_mod.dart';
import 'package:flutter_application_1/network.dart';

class ProductsService {
  static final dio = Dio();

  static Future<List<Product>> getProductsData() async {
    final response = await dio.get("${network.baseUrl}products");
    var data = response.data;
    pro_mod pro_mod = pro_mod.fromJson(data);

    return pro_mod.products ?? [];
  }
}
