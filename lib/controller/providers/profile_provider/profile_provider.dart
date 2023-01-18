import 'package:evo_mart/controller/providers/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:evo_mart/model/sign_up_model/sign_up_model.dart';
import 'package:evo_mart/services/sign_up_services/signup_services.dart';
import 'package:evo_mart/view/address/address_form.dart';
import 'package:evo_mart/view/address/show_address_page.dart';
import 'package:evo_mart/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

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

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SigninScreen(),
      ),
    );
    Provider.of<BottomNavProvider>(context, listen: false).currentIndex = 0;
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
        builder: (context) => const ShowAddressScreen(),
      ),
    );
    notifyListeners();
  }

  // void goToAddAddressPage(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => AddressFormScreen(addressScreenCheck: ,),
  //     ),
  //   );
  //   notifyListeners();
  // }
}
