import 'package:evo_mart/model/sign_up_model/sign_up_model.dart';
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
    final signupUser = SignupModel(
      email: emailId.text,
      password: password.text,
      phone: phoneNo.text,
      fullname: fullName.text,
    );

    signupServices.signupUser(signupUser, context);
    // (value) {
    //   if (value != null) {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(
    //         builder: (context) {
    //           return const OtpScreen();
    //         },
    //       ),
    //     );
    //     disposeTextfield();
    //   } else {
    //     return;
    //   }
    // },
    // );
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
}
