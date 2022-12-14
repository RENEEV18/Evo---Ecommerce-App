import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/otp_model/otp_model.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';
import 'package:flutter/cupertino.dart';

class OtpServices {
  SendOtpModel? otpModel;
  Dio dio = Dio();
  Future<SendOtpModel?> sendOtp(
      SendOtpModel model, BuildContext context) async {
    log('hai');
    log(model.toString());
    try {
      final Response response = await dio.get(
          ApiBaseUrl().baseUrl + ApiEndpoints.sendOtp,
          queryParameters: {"email": model.email}
          // data: model.toJson(),
          );
      log('reached');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final sendUserOtp = SendOtpModel.fromJson(response.data);
        log(sendUserOtp.toString());
        log('otp done');
        return sendUserOtp;
      }
    } on DioError catch (e) {
      log(e.message);
      log('otp failed');
      DioException().dioError(e, context);
    }
    return null;
  }
}
