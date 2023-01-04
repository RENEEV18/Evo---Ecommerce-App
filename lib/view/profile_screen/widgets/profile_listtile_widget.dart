import 'package:flutter/material.dart';

class ProfileListtileWidget extends StatelessWidget {
  const ProfileListtileWidget({
    Key? key,
    required this.text,
    required this.ontap,
    required this.icon,
    required this.trailIcon,
  }) : super(key: key);
  final String text;
  final Function() ontap;
  final Widget icon;
  final Widget trailIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: "Manrope",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: ontap,
      leading: icon,
      trailing: trailIcon,
    );
  }
}
