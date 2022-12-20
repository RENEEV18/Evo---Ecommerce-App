import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlidingWidget extends StatelessWidget {
  const SlidingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, value, child) {
      return SizedBox(
        height: 100,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              children: [
                kWidth,
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.amber.withOpacity(0.5),
                        backgroundImage: NetworkImage(
                            'http://172.16.5.206:5005/uploads/category/${value.categoryList[index].image}'),
                        radius: 35,
                      ),
                    ),
                    Text(
                      value.categoryList[index].name,
                    ),
                  ],
                ),
              ],
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: value.categoryList.length,
        ),
      );
    });
  }
}
