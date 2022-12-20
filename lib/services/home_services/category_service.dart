import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/home/category_model.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class CategoryServices {
  Future<List<CategoryModel>?> categoryUsers(context) async {
    final dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response =
          await dios.get(ApiBaseUrl().baseUrl + ApiEndpoints.category);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final List<CategoryModel> listCategory = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return listCategory;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
