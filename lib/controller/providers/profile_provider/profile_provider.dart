import 'package:evo_mart/model/sign_up_model/sign_up_model.dart';
import 'package:evo_mart/services/sign_up_services/signup_services.dart';
import 'package:evo_mart/view/profile_screen/widgets/address_form.dart';
import 'package:evo_mart/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  ProfileProvider(context) {
    getProfileUser(context);
  }
  SignupModel? model;
  List<String>? userData;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  void logOut(context) async {
    isLoading = true;
    notifyListeners();
    await storage.delete(key: 'token');
    await storage.delete(key: 'refreshToken');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => SigninScreen(),
        ),
        (route) => false);
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  void getProfileUser(context) async {
    await SignupServices().getUser(context).then((value) {
      if (value != null) {
        model = value;
        notifyListeners();
      }
    });
  }

  void goToAddressPage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddressFormScreen(),
      ),
    );
    notifyListeners();
  }
}
