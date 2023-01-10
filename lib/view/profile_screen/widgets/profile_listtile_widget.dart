import 'package:flutter/material.dart';

class ProfileListtileWidget extends StatelessWidget {
  const ProfileListtileWidget({
    Key? key,
    required this.text,
    required this.ontap,
    this.icon,
    required this.trailIcon,
    required this.size,
  }) : super(key: key);
  final String text;
  final Function() ontap;
  final Widget? icon;
  final Widget trailIcon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontFamily: "Manrope",
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: ontap,
      leading: icon,
      trailing: trailIcon,
    );
  }
}
