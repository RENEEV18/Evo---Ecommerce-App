import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/otp_model/verify_otp.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';
import 'package:flutter/cupertino.dart';

class VerifyOtpService {
  VerifyOtpModel? otpModel;
  Dio dio = Dio();
  Future<VerifyOtpModel?> verifyOtp(
      VerifyOtpModel model, String otpCode, BuildContext context) async {
    try {
      final Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.sendOtp,
        data: {
          model.toJson(),
        },
      );
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final verifyUserOtp = VerifyOtpModel.fromJson(response.data);
        log(verifyUserOtp.toString());
        log('otp verified');
        return verifyUserOtp;
      }
    } on DioError catch (e) {
      log(e.message);
      log('verification faliled');
      DioException().dioError(e, context);
    }
    return null;
  }
}
