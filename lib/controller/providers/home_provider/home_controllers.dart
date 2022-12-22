import 'dart:developer';
import 'package:evo_mart/model/home/carousel_model.dart';
import 'package:evo_mart/model/home/category_model.dart';
import 'package:evo_mart/model/home/product_model.dart';
import 'package:evo_mart/services/home_services/carousel_service.dart';
import 'package:evo_mart/services/home_services/category_service.dart';
import 'package:evo_mart/services/home_services/product_services.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(context) {
    getCategory(context);
    getCarousel(context);
    getProduct(context);
  }
  List<CategoryModel> categoryList = [];
  List<CarousalModel> carousalList = [];
  List<ProductModel> productList = [];

  int activeIndex = 0;

  bool isLoading = false;
  CategoryServices category = CategoryServices();
  CarousalService carousal = CarousalService();
  ProductServices product = ProductServices();

  void getCategory(context) async {
    isLoading = true;
    notifyListeners();
    await category.categoryUsers(context).then((value) {
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

  void getCarousel(context) async {
    isLoading = true;
    notifyListeners();
    await carousal.homeCarousel(context).then((value) {
      if (value != null) {
        //log('hello');
        // log('hai');
        // log(value.toString());
        log('carousal no null');
        carousalList = value;
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

  void getProduct(context) async {
    isLoading = true;
    notifyListeners();
    await product.homeProducts(context).then((value) {
      if (value != null) {
        productList = value;
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

  void smoothIndicator(index) {
    activeIndex = index;
    notifyListeners();
  }
}
