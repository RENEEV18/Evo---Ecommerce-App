import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/authentication_provider/sign_in_provider.dart';
import 'package:evo_mart/view/forgot_password_screen/forgot_password.dart';
import 'package:evo_mart/view/sign_in_screen/widgets/custom_clippath.dart';
import 'package:evo_mart/view/sign_up_screen/sign_up_screen.dart';
import 'package:evo_mart/view/widgets/custom_textfield.dart';
import 'package:evo_mart/view/widgets/main_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SignInProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  color: Colors.orange,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MainTextWidget(),
                        kHeight,
                        Consumer<SignInProvider>(
                            builder: (context, data, child) {
                          return CustomTextField(
                            text: 'Email',
                            controller: data.email,
                            validator: (value) => data.emailValdation(value),
                            keyboard: TextInputType.emailAddress,
                          );
                        }),
                        kGapSize,
                        Consumer<SignInProvider>(
                          builder: (context, value, child) {
                            return CustomTextField(
                              text: 'Password',
                              controller: value.passwordlog,
                              suffix: IconButton(
                                  onPressed: () {
                                    value.visibility();
                                  },
                                  icon: value.icon),
                              obscureText: value.obscureText,
                              validator: (passwordValue) =>
                                  value.passwordValdation(passwordValue),
                              keyboard: TextInputType.visiblePassword,
                            );
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontFamily: 'Manrope',
                                color: kTextfieldColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Consumer<SignInProvider>(
                      builder: (context, value, child) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                formGlobalKey.currentState!.save();
                                value.signIn(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kBlack,
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                        );
                      },
                    ),
                    kGapSize,
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(
                            color: kBlack, fontFamily: 'Manrope'),
                        children: [
                          TextSpan(
                            text: ' Create Account',
                            style: const TextStyle(
                                color: kTextfieldColor,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SignUpScreen();
                                    },
                                  ),
                                );
                              },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
