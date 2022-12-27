import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/cart/add_to_cart_model.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class CartService {
  Future<String?> addToCart(CartModel model, context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.cart,
        data: jsonEncode(model.toString()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final cartResponse = response.data['message'];
        return cartResponse;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<CartModel?> getCart(context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        ApiBaseUrl().baseUrl + ApiEndpoints.cart,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final CartModel model = CartModel.fromJson(response.data);
        return model;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
