import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/model/sign_up_model/sign_up_model.dart';
import 'package:evo_mart/services/otp_api_service/verify_otp.dart';
import 'package:evo_mart/services/sign_up_services/signup_services.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:evo_mart/view/bottom_nav.dart';
import 'package:flutter/material.dart';

class VerifyOtpProvider extends ChangeNotifier {
  VerifyOtpService verifyOtpService = VerifyOtpService();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';

// final model = SignupModel(
//     email: SignUpProvider().emailId.text,
//     password: SignUpProvider().password.text,
//     phone: SignUpProvider().phoneNo.text,
//     fullname: SignUpProvider().fullName.text,
//   );

  void onSubmitCode(String submitCode) {
    log(submitCode);
    code = submitCode;
    notifyListeners();
  }

  void sumbitOtp(SignupModel model, code, context) {
    if (code.length != 4) {
      SnackBarPop.popUp(context, 'Please enter the OTP', Colors.red);
    } else {
      isLoading = true;
      notifyListeners();
      verifyOtpService.verifyOtp(model.email, code, context).then(
        (value) {
          if (value != null) {
            SignupServices().signupUser(model, context).then((value) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) {
                  return const BottomNav();
                },
              ), (route) => false);
              isLoading = false;
              notifyListeners();
            });
          }
        },
      );
    }
  }
}
