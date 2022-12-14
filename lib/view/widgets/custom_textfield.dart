import 'package:evo_mart/common/const/const.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.suffix,
    required this.controller,
    required this.validator,
    this.obscureText,
    required this.keyboard,
    this.onChanged,
    required this.text,
  }) : super(key: key);

  final Widget? suffix;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool? obscureText;
  final String text;
  final TextInputType keyboard;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      keyboardType: keyboard,
      controller: controller,
      style: const TextStyle(color: kBlack),
      validator: validator,
      decoration: InputDecoration(
        // fillColor: Color.fromARGB(17, 0, 0, 0),
        // filled: true,
        suffixIcon: suffix,
        label: Text(
          text,
          style: const TextStyle(color: kBlack, fontFamily: 'Manrope'),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kBlack),
          borderRadius: BorderRadius.circular(20),
        ),
        enabled: true,
      ),
    );
  }
}
