import 'package:evo_mart/controller/providers/profile_provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(body: Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            Center(
              child: IconButton(
                onPressed: () {
                  value.logOut(context);
                },
                icon: const Icon(FontAwesomeIcons.arrowRightToBracket),
              ),
            ),
          ],
        );
      },
    ));
  }
}
