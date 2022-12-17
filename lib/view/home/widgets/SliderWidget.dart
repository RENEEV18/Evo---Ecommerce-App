import 'package:evo_mart/common/const/const.dart';
import 'package:flutter/material.dart';

class SlidingWidget extends StatelessWidget {
  const SlidingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Row(
            children: [
              kWidth,
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber.withOpacity(0.5),
                    radius: 35,
                  ),
                  Text(
                    text[index],
                  ),
                ],
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 5,
      ),
    );
  }
}
