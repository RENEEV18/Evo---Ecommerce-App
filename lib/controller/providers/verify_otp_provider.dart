import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evo_mart/model/otp_model/verify_otp.dart';
import 'package:evo_mart/services/otp_api_service/verify_otp.dart';
import 'package:evo_mart/view/home/home.dart';
import 'package:flutter/material.dart';

class VerifyOtpProvider extends ChangeNotifier {
  VerifyOtpService verifyOtpService = VerifyOtpService();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode);
    code = submitCode;
    notifyListeners();
  }

  void sumbitOtp(String email, String code, BuildContext context) {
    isLoading = true;
    notifyListeners();

    VerifyOtpModel verifyOtpModel = VerifyOtpModel(email: email, code: code);

    verifyOtpService.verifyOtp(verifyOtpModel, code, context).then((value) {
      if (value != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
      }
    });

    isLoading = false;
    notifyListeners();
  }
}
