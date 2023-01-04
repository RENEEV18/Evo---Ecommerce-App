import 'package:evo_mart/services/address/address_service.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();

  bool isLoading = false;
  void getAddress(context) async {
    isLoading = true;
    notifyListeners();

    await AddressService().getAddress(context).then((value) {});
  }
}
