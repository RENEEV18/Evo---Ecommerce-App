import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/sign_up_provider.dart';
import 'package:evo_mart/view/sign_in_screen/sign_in_screen.dart';
import 'package:evo_mart/view/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);

    // final data = Provider.of<EmailValidatorProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formGlobalKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Consumer<SignUpProvider>(
                        builder: (context, data, child) {
                      return Column(
                        children: [
                          //kHeight,
                          const Text(
                            'Create Account',
                            style: TextStyle(
                                color: kBlack,
                                fontFamily: 'FredokaOne',
                                fontSize: 22),
                          ),
                          kHeight,
                          CustomTextField(
                            text: 'Full Name',
                            controller: provider.fullName,
                            validator: (value) => data.nameValidation(value),
                            keyboard: TextInputType.name,
                          ),
                          kHeight,
                          CustomTextField(
                            text: 'Email',
                            controller: provider.emailId,
                            validator: (value) => data.emailValdation(value),
                            keyboard: TextInputType.emailAddress,
                          ),
                          kHeight,
                          CustomTextField(
                            text: 'Mobile Number',
                            controller: provider.phoneNo,
                            validator: (value) => data.mobileValdation(value),
                            keyboard: TextInputType.phone,
                          ),
                          kHeight,
                          CustomTextField(
                            suffix: IconButton(
                                onPressed: () {
                                  data.visibility();
                                },
                                icon: data.icon),
                            text: 'Password',
                            obscureText: data.obscureText,
                            controller: provider.password,
                            validator: (passwordValue) =>
                                provider.passwordValdation(passwordValue),
                            keyboard: TextInputType.visiblePassword,
                          ),

                          kHeight,
                          CustomTextField(
                            text: 'Confirm Password',
                            controller: provider.confirmPassword,
                            obscureText: data.obscureText,
                            validator: (passwordValue) =>
                                data.passwordValdation(passwordValue),
                            keyboard: TextInputType.visiblePassword,
                          ),

                          kHeight,
                          Consumer<SignUpProvider>(
                            builder: (context, value, child) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      formGlobalKey.currentState!.save();

                                      // value.signupUser(context);
                                      value.signupUser(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kBlack,
                                  ),
                                  child: const Text(
                                    'Signup',
                                    style: TextStyle(
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          kGapSize,
                          RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: const TextStyle(
                                  color: kBlack, fontFamily: 'Manrope'),
                              children: [
                                TextSpan(
                                  text: ' Sign in',
                                  style:
                                      const TextStyle(color: kTextfieldColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SigninScreen();
                                          },
                                        ),
                                      );
                                    },
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
