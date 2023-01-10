import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/cart/add_to_cart_model.dart';
import 'package:evo_mart/model/cart/get_cart_model.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class CartService {
  // Future<int?> addOrRemoveCart(context, productId, CartModel model) async {
  //   Dio dios = await ApiInterceptor().getApiUser(context);
  //   try {
  //     final Response response =
  //         await dios.post(ApiBaseUrl().baseUrl + ApiEndpoints.cart, data: {
  //       jsonEncode(
  //         model.toString(),
  //       ),
  //     });
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.statusCode;
  //     } else if (response.statusCode == 204) {
  //       return response.statusCode;
  //     }
  //   } on DioError catch (e) {
  //     log(e.message);
  //     DioException().dioError(e, context);
  //   }
  //   return null;
  // }
  Future<String?> addToCart(AddToCartModel model, context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.cart,
        data: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final cartResponse = response.data['message'];
          return cartResponse;
        }
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
        if (response.data == null) {
          return null;
        } else {
          final CartModel model = CartModel.fromJson(response.data);

          log(response.data.toString());
          return model;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<List<CartModel>?> getSingleCart(
      context, String productId, String cartId) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        "${ApiBaseUrl().baseUrl + ApiEndpoints.cart}/$cartId/product/$productId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final List<CartModel> model = (response.data as List)
              .map((e) => CartModel.fromJson(e))
              .toList();

          log(response.data.toString());
          return model;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<String?> removeFromCart(context, String id) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.patch(
        ApiBaseUrl().baseUrl + ApiEndpoints.cart,
        data: {
          "product": id,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final cartRemove = response.data['message'];
        return cartRemove;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
