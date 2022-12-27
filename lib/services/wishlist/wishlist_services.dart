import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/wishlist_model/wishlist_model.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class WishlistService {
  Future<int?> addOrRemoveWishlist(context, productId) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response =
          await dios.post(ApiBaseUrl().baseUrl + ApiEndpoints.wishlist, data: {
        'product': productId,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.statusCode;
      } else if (response.statusCode == 204) {
        return response.statusCode;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<WishListModel?> getWishlist(context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        ApiBaseUrl().baseUrl + ApiEndpoints.wishlist,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final WishListModel model = WishListModel.fromJson(response.data);
        return model;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
