import 'dart:developer';

import 'package:evo_mart/model/address/create_address.dart';
import 'package:evo_mart/model/address/get_address.dart';
import 'package:evo_mart/services/address/address_service.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  AddressProvider(context) {
    getAllAddress(context);
  }
  final TextEditingController titleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();

  bool isLoading = false;
  bool isLoading2 = false;
  List<GetAddressModel> addressList = [];
  CreateAddressModel? createAddress;

  Future<String?> getAllAddress(context) async {
    isLoading = true;
    notifyListeners();
    await AddressService().getAddress(context).then((value) {
      if (value != null) {
        log(value.toString());
        addressList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
        return 'Done';
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    });
    return null;
  }

  void addAddress(context) async {
    isLoading2 = true;
    notifyListeners();
    final CreateAddressModel model = CreateAddressModel(
      title: titleController.text,
      fullName: nameController.text,
      phone: phoneController.text,
      pin: pinController.text,
      state: stateController.text,
      place: placeController.text,
      address: addressController.text,
      landMark: landmarkController.text,
    );

    await AddressService().addAddress(model, context).then((value) {
      if (value != null) {
        log('hai');
        clearAllControllers();
        Navigator.of(context).pop();
        isLoading2 = false;
        notifyListeners();
      } else {
        isLoading2 = false;
        notifyListeners();
      }
    });
    return null;
  }

  void saveAddress(context) {
    addAddress(context);
    notifyListeners();
  }

  void updateAddress(String addressId, context) async {
    isLoading2 = true;
    notifyListeners();
    final CreateAddressModel model = CreateAddressModel(
      title: titleController.text,
      fullName: nameController.text,
      phone: phoneController.text,
      pin: pinController.text,
      state: stateController.text,
      place: placeController.text,
      address: addressController.text,
      landMark: landmarkController.text,
    );
    await AddressService()
        .updateAddress(model, addressId, context)
        .then((value) {
      if (value != null) {
        clearAllControllers();
        Navigator.of(context).pop();
        isLoading2 = false;
        notifyListeners();
      } else {
        isLoading2 = false;
        notifyListeners();
      }
    });
    return null;
  }

  void deleteAddress(String addressId, context) async {
    log('delete function entered');
    isLoading2 = true;
    notifyListeners();
    await AddressService().deleteAddress(addressId, context).then((value) {
      if (value != null) {
        getAllAddress(context);
        pop(context);
        SnackBarPop.popUp(context, "Address removed successfully", Colors.red);
        notifyListeners();
      } else {
        return null;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  // String? usernameValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter the username';
  //   } else if (value.length < 2) {
  //     return 'Too short username';
  //   } else {
  //     return null;
  //   }
  // }
  void pop(context) {
    Navigator.of(context).pop();
    notifyListeners();
  }

  void clearAllControllers() {
    nameController.clear();
    titleController.clear();
    pinController.clear();
    stateController.clear();
    placeController.clear();
    addressController.clear();
    phoneController.clear();
    landmarkController.clear();
  }
}
