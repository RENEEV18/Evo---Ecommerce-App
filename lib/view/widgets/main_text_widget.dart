import 'package:evo_mart/common/const/const.dart';
import 'package:flutter/material.dart';

class MainTextWidget extends StatelessWidget {
  const MainTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Evo',
        style: TextStyle(
          fontFamily: 'FredokaOne',
          fontSize: 30,
          color: kBlack,
        ),
      ),
    );
  }
}
