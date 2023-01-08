import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/profile_provider/profile_provider.dart';
import 'package:evo_mart/view/profile_screen/widgets/profile_listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hello RJ",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Explore on Evo",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kTextfieldColor,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kHeight,
                  Row(
                    children: const [
                      kWidth,
                      Text('Account Settings', style: kCommonTextstyle),
                    ],
                  ),
                  kSize,
                  Card(
                    elevation: 0.1,
                    color: kWhite,
                    child: Column(
                      children: [
                        ProfileListtileWidget(
                          icon: const Icon(
                            Icons.person,
                          ),
                          text: 'Edit profile',
                          ontap: () {},
                          trailIcon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                        ProfileListtileWidget(
                          icon: const Icon(
                            Icons.location_on,
                          ),
                          text: 'Saved Address',
                          ontap: () {
                            value.goToAddressPage(context);
                          },
                          trailIcon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kSize,
                  Row(
                    children: const [
                      kWidth,
                      Text('Information & Feedback', style: kCommonTextstyle),
                    ],
                  ),
                  kSize,
                  Card(
                    elevation: 0.1,
                    child: Column(
                      children: [
                        ProfileListtileWidget(
                          icon: const Icon(
                            Icons.description,
                          ),
                          text: 'Terms & Condition',
                          ontap: () {},
                          trailIcon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                        ProfileListtileWidget(
                          icon: const Icon(
                            Icons.privacy_tip,
                          ),
                          text: 'Privacy Policy',
                          ontap: () {},
                          trailIcon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                        ProfileListtileWidget(
                          icon: const Icon(
                            Icons.info,
                          ),
                          text: 'About',
                          ontap: () {},
                          trailIcon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                        ProfileListtileWidget(
                          icon: const Icon(
                            Icons.logout,
                          ),
                          text: 'Log Out',
                          ontap: () {
                            value.logOut(context);
                          },
                          trailIcon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kGapSize,
                  // value.isLoading == true
                  //     ? const CircularProgressIndicator(
                  //         strokeWidth: 2,
                  //       )
                  //     : SizedBox(
                  //         width: MediaQuery.of(context).size.width * 0.92,
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             value.logOut(context);
                  //           },
                  //           style: ElevatedButton.styleFrom(
                  //               backgroundColor: kWhite,
                  //               shape: RoundedRectangleBorder(
                  //                 side: BorderSide(),
                  //                 borderRadius: BorderRadius.circular(20),
                  //               )),
                  //           child: const Text(
                  //             'Log Out',
                  //             style: TextStyle(
                  //               fontFamily: "Manrope",
                  //               fontSize: 15,
                  //               color: kRed,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
