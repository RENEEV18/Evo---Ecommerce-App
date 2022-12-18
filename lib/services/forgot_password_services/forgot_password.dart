import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/forgot_password/forgot_pasword_model.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordService {
  Dio dio = Dio();

  Future<ForgotPasswordModel?> forgotPassword(
      ForgotPasswordModel model, BuildContext context) async {
    try {
      final Response response = await dio
          .post(ApiBaseUrl().baseUrl + ApiEndpoints.forgotpassword, data: {
        model.email,
        model.password,
      });
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final forgotPassword = ForgotPasswordModel.fromJson(response.data);
        return forgotPassword;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
