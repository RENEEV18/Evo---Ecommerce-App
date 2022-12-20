import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/model/sign_in_model/sign_in.dart';
import 'package:evo_mart/services/sign_in_services/sign_in_service.dart';
import 'package:evo_mart/view/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController passwordlog = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  SigninServices signinServices = SigninServices();
  bool isLoading = false;
  void signIn(BuildContext context) {
    isLoading = true;
    notifyListeners();
    final SigninModel signinModel = SigninModel(
      email: email.text,
      password: passwordlog.text,
    );
    signinServices.signinUser(signinModel, context).then(
      (value) {
        if (value != null) {
          storage.write(key: 'token', value: value.accessToken);
          storage.write(key: 'refreshToken', value: value.refreshToken);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return const BottomNav();
            },
          ), (route) => false);
          disposeTextfield();
        } else {
          return;
        }
      },
    );
    isLoading = false;
    notifyListeners();
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

  void disposeTextfield() {
    email.clear();
    passwordlog.clear();
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
}
