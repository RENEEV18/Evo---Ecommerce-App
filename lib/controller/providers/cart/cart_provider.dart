import 'dart:developer';

import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/model/cart/add_to_cart_model.dart';
import 'package:evo_mart/model/cart/get_cart_model.dart';
import 'package:evo_mart/services/cart/cart_services.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  CartProvider(context) {
    getCart(context);
  }

  bool isLoading = false;
  CartModel? cartList;
  List<String> cartItemsId = [];
  int quantity = 1;
  String size = "5 inch";
  CartService service = CartService();

  void getCart(context) async {
    isLoading = true;
    notifyListeners();
    await service.getCart(context).then(
      (value) {
        if (value != null) {
          cartList = value;
          notifyListeners();
          cartItemsId = cartList!.products.map((e) => e.product.id).toList();
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
        }
      },
    );
  }

  void addToCart(String productId, context) async {
    log('here');
    isLoading = true;
    notifyListeners();
    final AddToCartModel model = AddToCartModel(
      size: size,
      quantity: quantity,
      productId: productId,
    );
    await service.addToCart(model, context).then((value) {
      if (value != null) {
        getCart(context);
        if (value == "product added to cart successfully") {
          SnackBarPop.popUp(
              context, "Product Added To Cart Successfully", Colors.green);
        }
        // isLoading = false;
        // notifyListeners();
        // service.getCart(context).then((value) {
        //   if (value != null) {
        //     cartList = value;
        //     notifyListeners();
        //     getCart(context);
        //     isLoading = false;
        //     notifyListeners();
        //   } else {
        //     isLoading = false;
        //     notifyListeners();
        //   }
        // });
        // if (value == 200) {
        //   SnackBarPop.popUp(
        //       context, 'Item added to Catr Successfully ', Colors.green);
        // }
        // if (value == 204) {
        //   SnackBarPop.popUp(
        //       context, 'Item removed from Cart Successfully ', Colors.red);
        // }
      } else {
        null;
        // isLoading = false;
        // notifyListeners();
      }
    });
  }

  void removeCart(context, productId) {
    log('get in to remove controller');
    service.removeFromCart(context, productId).then((value) {
      if (value != null) {
        getCart(context);
        SnackBarPop.popUp(
            context, 'Product removed from cart Successfully', kRed);
        notifyListeners();
      } else {
        return;
      }
    });
  }
  // void addOrRemoveFromCart(context, String productId) async {
  //   isLoading = true;
  //   notifyListeners();
  //   await service.addOrRemoveCart(context, productId, cartList!).then((value) {
  //     if (value != null) {
  //       service.getCart(context).then((value) {
  //         if (value != null) {
  //           cartList = value;
  //           notifyListeners();
  //           getCart(context);
  //           isLoading = false;
  //           notifyListeners();
  //         } else {
  //           isLoading = false;
  //           notifyListeners();
  //         }
  //       });
  //       if (value == 201) {
  //         SnackBarPop.popUp(context, 'Item added to Wishlist ', Colors.green);
  //       }
  //       if (value == 204) {
  //         SnackBarPop.popUp(context, 'Item removed from Wishlist ', Colors.red);
  //       }
  //     } else {
  //       isLoading = false;
  //       notifyListeners();
  //     }
  //   });
  // }

}
