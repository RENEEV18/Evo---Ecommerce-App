import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressFormScreen extends StatelessWidget {
  AddressFormScreen({super.key});

  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    children: [
                      kGapSize,
                      CustomTextField(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.titleController,
                        validator: (name) {
                          // value.usernameValidation(name);
                          return null;
                        },
                        keyboard: TextInputType.name,
                        text: "title",
                        preffix: const Icon(Icons.person),
                      ),
                      kGapSize,
                      CustomTextField(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.nameController,
                        validator: (name) {
                          // value.usernameValidation(name);
                          return null;
                        },
                        keyboard: TextInputType.name,
                        text: "Full Name ",
                        preffix: const Icon(Icons.person),
                      ),
                      kGapSize,
                      CustomTextField(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.phoneController,
                        validator: (name) {
                          // value.usernameValidation(name);
                          return null;
                        },
                        keyboard: TextInputType.name,
                        preffix: const Icon(Icons.phone),
                        text: "Phone Number ",
                      ),
                      kGapSize,
                      Row(
                        children: [
                          Flexible(
                            child: CustomTextField(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              controller: value.pinController,
                              validator: (name) {
                                // value.usernameValidation(name);
                                return null;
                              },
                              keyboard: TextInputType.name,
                              text: "PIN Code",
                              preffix: const Icon(Icons.pin),
                            ),
                          ),
                          kHeadLineWidth,
                          Flexible(
                            child: CustomTextField(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              controller: value.stateController,
                              validator: (name) {
                                // value.usernameValidation(name);
                                return null;
                              },
                              keyboard: TextInputType.name,
                              text: "State",
                              preffix: const Icon(Icons.public),
                            ),
                          ),
                        ],
                      ),
                      kGapSize,
                      CustomTextField(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.placeController,
                        validator: (name) {
                          // value.usernameValidation(name);
                          return null;
                        },
                        keyboard: TextInputType.name,
                        text: "Place",
                        preffix: const Icon(Icons.location_on),
                      ),
                      kGapSize,
                      CustomTextField(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.addressController,
                        validator: (name) {
                          // value.usernameValidation(name);
                          return null;
                        },
                        keyboard: TextInputType.name,
                        text: "Address",
                        preffix: const Icon(
                          Icons.contact_mail,
                        ),
                      ),
                      kGapSize,
                      CustomTextField(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        controller: value.landmarkController,
                        validator: (name) {
                          // value.usernameValidation(name);
                          return null;
                        },
                        keyboard: TextInputType.name,
                        text: "LandMark",
                        preffix: const Icon(Icons.emoji_flags),
                      ),
                      kGapSize,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.92,
                        child: ElevatedButton(
                          onPressed: () {
                            value.saveAddress(context);
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
