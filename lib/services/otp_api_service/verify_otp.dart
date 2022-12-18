import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class VerifyOtpService {
  Dio dio = Dio();
  Future<String?> verifyOtp(email, otpCode, context) async {
    try {
      final Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.sendOtp,
        data: {
          'email': email,
          'otp': otpCode,
        },
      );
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp verified');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message);
      log('verification faliled');
      DioException().dioError(e, context);
    }
    return null;
  }
}
