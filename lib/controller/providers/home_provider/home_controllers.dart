import 'dart:developer';
import 'package:evo_mart/model/home/carousel_model.dart';
import 'package:evo_mart/model/home/category_model.dart';
import 'package:evo_mart/model/home/product_model.dart';
import 'package:evo_mart/services/home_services/carousel_service.dart';
import 'package:evo_mart/services/home_services/category_service.dart';
import 'package:evo_mart/services/home_services/product_services.dart';
import 'package:evo_mart/view/product_screen/product_view.dart';
import 'package:flutter/material.dart';

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

  ProductModel findById(String id) {
    return productList.firstWhere((element) => element.id == id);
  }

  void toProductScreen(context, index) {
    Navigator.of(context)
        .pushNamed(ProductView.routeName, arguments: productList[index].id);
  }

  // void inToProductScreen(
  //     context, productId, name, price, offer, size, image, category, rating) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => ProductView(
  //       id: productId,
  //       name: name,
  //       price: price,
  //       offer: offer,
  //       size: size,
  //       image: image,
  //       category: category,
  //       rating: rating,
  //     ),
  //   ));

  // notifyListeners();
}
