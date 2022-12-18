import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/sign_in_model/sign_in.dart';
import 'package:evo_mart/model/sign_in_model/sign_in_token.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';
import 'package:flutter/cupertino.dart';

class SigninServices {
  Dio dio = Dio();
  SigninModel? signinModel;
  Future<SigninTokenModel?> signinUser(
      SigninModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.signIn,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final signinModel = SigninTokenModel.fromJson(response.data);
        log(response.data.toString());

        return signinModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
