import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class OtpServices {
  Dio dio = Dio();
  Future<String?> sendOtp(email, context) async {
    log('otp enabled');
    try {
      final Response response = await dio.get(
        ApiBaseUrl().baseUrl + ApiEndpoints.sendOtp,
        queryParameters: {"email": email},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp created');
        log('otp done');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message);
      log('otp failed');
      DioException().dioError(e, context);
    }
    return null;
  }
}
