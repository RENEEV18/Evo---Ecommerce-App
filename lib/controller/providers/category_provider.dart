import 'package:evo_mart/model/home/category_model.dart';
import 'package:evo_mart/services/home_services/category_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider(context) {
    getCategory(context);
  }
  //final TextEditingController homeController = TextEditingController();
  List<CategoryModel> categoryList = [];
  bool isLoading = false;
  CategoryServices services = CategoryServices();

  void getCategory(context) async {
    isLoading = true;
    notifyListeners();
    await services.categoryUsers(context).then((value) {
      if (value != null) {
        categoryList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    });
  }
}
