import 'dart:developer';
import 'package:evo_mart/model/otp_model/otp_model.dart';
import 'package:evo_mart/services/otp_api_service/send_otp.dart';
import 'package:evo_mart/view/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  bool isLoading = false;
  OtpServices otpServices = OtpServices();
  void sendOtp(String email, BuildContext context) {
    isLoading = true;
    notifyListeners();

    SendOtpModel sendOtpModel = SendOtpModel(email: email);
    log('otp send');
    otpServices.sendOtp(sendOtpModel, context).then(
      (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const OtpScreen();
            },
          ),
        );
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
