import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/sign_up_provider.dart';
import 'package:evo_mart/controller/providers/verify_otp_provider.dart';
import 'package:evo_mart/view/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<VerifyOtpProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/1412_otp_verification.png',
                  width: 300,
                ),
                const Text(
                  'OTP Verification',
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w500, color: kBlack),
                ),
                const Text(
                  'Plaese enter the 6 digit code that \nwas send to your number  ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: kHintBlack),
                ),
                kGapSize,
                Consumer<VerifyOtpProvider>(
                  builder: (context, value, child) {
                    return OtpTextField(
                      textStyle: const TextStyle(color: Colors.black),
                      numberOfFields: 4,
                      borderColor: kBlack,
                      enabledBorderColor: kBlack,
                      borderRadius: BorderRadius.circular(12),
                      showFieldAsBox: true,
                      onSubmit: (String verificationCode) {
                        value.onSubmitCode(verificationCode);
                        // data.sumbitOtp(value.phoneNo.text, context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Success"),
                              content: Text('User created successfully'),
                            );
                          },
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return const BottomNav();
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                kGapSize,
                Consumer2<VerifyOtpProvider, SignUpProvider>(
                  builder: (context, value, value2, child) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: ElevatedButton(
                        onPressed: () {
                          value.sumbitOtp(
                              value2.emailId.text, value.code, context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(color: kWhite),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
