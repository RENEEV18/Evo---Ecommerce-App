import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/home/product_model.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class ProductServices {
  Future<List<ProductModel>?> homeProducts(context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response =
          await dios.get(ApiBaseUrl().baseUrl + ApiEndpoints.product);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final List<ProductModel> productList = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return productList;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
