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
  bool isSelected = true;
  bool isOfficeSelected = false;

  List<GetAddressModel> addressList = [];
  String addressType = 'Home';

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
        // return 'Done';
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
      title: addressType,
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
        SnackBarPop.popUp(context, 'Address added successfully', Colors.green);
        isLoading2 = false;
        getAllAddress(context);
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
        isLoading2 = false;
        notifyListeners();
      } else {
        return null;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void buttonSelection() {
    isSelected = !isSelected;
    notifyListeners();
    isSelected == true ? addressType = 'Home' : addressType = 'Office';
    notifyListeners();
  }

  String? fullNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
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

  String? pincodeValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your PIN number';
    } else if (value.length < 6) {
      return 'Invalid Pin No';
    } else {
      return null;
    }
  }

  String? stateValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  String? placeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  String? addressValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  String? landmarkValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  void pop(context) {
    Navigator.of(context).pop();
    notifyListeners();
  }

  void clearAllControllers() {
    nameController.clear();
    addressType = "Home";
    pinController.clear();
    stateController.clear();
    placeController.clear();
    addressController.clear();
    phoneController.clear();
    landmarkController.clear();
  }
}
