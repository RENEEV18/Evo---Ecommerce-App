import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/home/carousel_model.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class CarousalService {
  // Dio dio = Dio();
  Future<List<CarousalModel>?> homeCarousel(context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    log(' entered');
    try {
      log(' try');
      final Response response = await dios.get(
        ApiBaseUrl().baseUrl + ApiEndpoints.carousal,
      );
      log('status code in carousal service function');
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.data.toString());
        final List<CarousalModel> carousel = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        log('carousal in decoded format');
        log(carousel[0].id.toString());
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
