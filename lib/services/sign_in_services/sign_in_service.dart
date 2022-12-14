import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/sign_in_model/sign_in.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';
import 'package:flutter/cupertino.dart';

class SigninServices {
  Dio dio = Dio();
  SigninModel? signinModel;
  Future<SigninModel?> signinUser(
      SigninModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.signIn,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        signinModel = SigninModel.fromJson(response.data);
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
 
 
 
 
  // Future<void> signIn(String name, String password) async {
  //   String apiUrl = '$baseUrl/sign-in';
  //   try {
  //     final Response response =
  //         await dio.post(apiUrl, data: {'name': name, 'password': password});
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // final data = jsonDecode(response.data.toString());
  //       log(response.data.toString());
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //   }
  // }