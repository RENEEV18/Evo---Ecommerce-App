import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/model/sign_up_model/sign_up_model.dart';
import 'package:evo_mart/services/otp_api_service/send_otp.dart';
import 'package:evo_mart/services/sign_up_services/signup_services.dart';
import 'package:evo_mart/view/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  SignupServices signupServices = SignupServices();
  bool isLoading = false;
  Future<void> signupUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final model = SignupModel(
      email: emailId.text,
      password: password.text,
      phone: phoneNo.text,
      fullname: fullName.text,
    );

    OtpServices().sendOtp(model.email, context).then((value) {
      if (value != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OtpScreen(
                model: model,
              );
            },
          ),
        );
        disposeTextfield();
      } else {
        return;
      }
    });

    isLoading = false;
    notifyListeners();
  }

  void disposeTextfield() {
    fullName.clear();
    username.clear();
    emailId.clear();
    password.clear();
    phoneNo.clear();
    confirmPassword.clear();
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
  }

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  String? mobileValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length < 10) {
      return 'Invalid mobile number,make sure your entered 10 digits';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
      return 'Password exceeds 8 character';
    }
    return null;
  }

  String? confirmpasswordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != password.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: kBlack,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: kBlack,
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: kBlack,
      );
      obscureText = false;
      notifyListeners();
    }
  }
}
