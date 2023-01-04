import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddressFormScreen extends StatelessWidget {
  const AddressFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Addresses",
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
            child: Column(
              children: [
                CustomTextField(controller: , validator: validator, keyboard: keyboard, text: text,),
              ],
            ),
          );
          }
         
        )
      ),
    );
  }
}
