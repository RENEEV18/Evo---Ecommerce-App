import 'dart:developer';

import 'package:evo_mart/model/carousel_model/carousel_model.dart';
import 'package:evo_mart/services/home_services/carousel_service.dart';
import 'package:flutter/cupertino.dart';

class CarouselProvider extends ChangeNotifier {
  CarouselProvider(context) {
    getCarousel(context);
  }
  bool isLoading = false;
  List<CarousalModel> carousalList = [];

  CarousalService service = CarousalService();

  void getCarousel(context) async {
    log(carousalList.toString());
    isLoading = true;
    notifyListeners();
    await service.homeCarousel(context).then((value) {
      if (value != null) {
        log(value.toString());
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
}
