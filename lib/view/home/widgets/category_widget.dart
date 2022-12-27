import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return SizedBox(
        height: 100,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return value.isLoading == true
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                  )
                : Row(
                    children: [
                      kWidth,
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.amber.withOpacity(0.5),
                              backgroundImage: NetworkImage(
                                  'http://172.16.5.206:5005/category/${value.categoryList[index].image}'),
                              radius: 30,
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
          separatorBuilder: (BuildContext context, int index) {
            return kWidth;
          },
        ),
      );
    });
  }
}
