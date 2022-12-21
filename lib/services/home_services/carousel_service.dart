import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/carousel_model/carousel_model.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class CarousalService {
  // Dio dio = Dio();
  Future<List<CarousalModel>?> homeCarousel(context) async {
    final dios = await ApiInterceptor().getApiUser(context);
    try {
      log('hai');
      final Response response = await dios.get(
        ApiBaseUrl().baseUrl + ApiEndpoints.carousal,
      );
      if (response.data == 200 || response.data == 201) {
        log(response.data.toString());
        final List<CarousalModel> carousel = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return carousel;
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
