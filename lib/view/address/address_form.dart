import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/model/address/enum_address_.dart';
import 'package:evo_mart/view/address/widgets/button.dart';
import 'package:evo_mart/view/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressFormScreen extends StatelessWidget {
  AddressFormScreen(
      {super.key, required this.addressScreenCheck, required this.addressId});

  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  final AddressScreen addressScreenCheck;
  final String addressId;
  static const routeAddressName = '/address_form';
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<AddressProvider>(context, listen: false)
            .setAddressScreen(addressScreenCheck, addressId, context);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Addresse",
          style: TextStyle(
            fontFamily: "Manrope",
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<AddressProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: formGlobalKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      kGapSize,
                      CustomFormWidget(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.nameController,
                        validator: (name) {
                          return value.fullNameValidation(name);
                        },
                        keyboard: TextInputType.name,
                        text: "Full Name ",
                        preffix: const Icon(Icons.person),
                      ),
                      kGapSize,
                      CustomFormWidget(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.phoneController,
                        validator: (phone) {
                          return value.mobileValdation(phone);
                        },
                        keyboard: TextInputType.name,
                        preffix: const Icon(Icons.phone),
                        text: "Phone Number ",
                      ),
                      kGapSize,
                      Row(
                        children: [
                          Flexible(
                            child: CustomFormWidget(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              controller: value.pinController,
                              validator: (pin) {
                                return value.pincodeValdation(pin);
                              },
                              keyboard: TextInputType.name,
                              text: "PIN Code",
                              preffix: const Icon(Icons.pin),
                            ),
                          ),
                          kHeadLineWidth,
                          Flexible(
                            child: CustomFormWidget(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              controller: value.stateController,
                              validator: (state) {
                                return value.stateValidation(state);
                              },
                              keyboard: TextInputType.name,
                              text: "State",
                              preffix: const Icon(Icons.public),
                            ),
                          ),
                        ],
                      ),
                      kGapSize,
                      CustomFormWidget(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.placeController,
                        validator: (place) {
                          return value.placeValidation(place);
                        },
                        keyboard: TextInputType.name,
                        text: "Place",
                        preffix: const Icon(Icons.location_on),
                      ),
                      kGapSize,
                      CustomFormWidget(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.addressController,
                        validator: (address) {
                          return value.addressValidation(address);
                        },
                        keyboard: TextInputType.name,
                        text: "Address",
                        preffix: const Icon(
                          Icons.contact_mail,
                        ),
                      ),
                      kGapSize,
                      CustomFormWidget(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.landmarkController,
                        validator: (land) {
                          return value.landmarkValidation(land);
                        },
                        keyboard: TextInputType.name,
                        text: "LandMark",
                        preffix: const Icon(Icons.emoji_flags),
                      ),
                      kGapSize,
                      Row(
                        children: const [
                          Text(
                            'Type of address',
                            style: TextStyle(
                              color: kBlack,
                              fontFamily: "Manrope",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      kSize,
                      Row(
                        children: [
                          AddressTypeButton(
                            icon: Icons.home,
                            onPressed: () {
                              value.buttonSelection();
                            },
                            text: 'Home',
                            color: value.isSelected == true
                                ? kTextfieldColor
                                : kgery,
                            textColor: value.isSelected == true
                                ? kTextfieldColor
                                : kgery,
                            borderColor: value.isSelected == true
                                ? kTextfieldColor
                                : kgery,
                          ),
                          kWidth,
                          AddressTypeButton(
                            icon: Icons.apartment,
                            onPressed: () {
                              value.buttonSelection();
                            },
                            text: 'Office',
                            color: value.isSelected == false
                                ? kTextfieldColor
                                : kgery,
                            textColor: value.isSelected == false
                                ? kTextfieldColor
                                : kgery,
                            borderColor: value.isSelected == false
                                ? kTextfieldColor
                                : kgery,
                          ),
                        ],
                      ),
                      kSize,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.92,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();
                              value.saveAddress(
                                  context, addressScreenCheck, addressId);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kTextfieldColor,
                          ),
                          child: const Text(
                            'Save Address',
                            style: TextStyle(
                              fontFamily: "Manrope",
                              fontSize: 15,
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
