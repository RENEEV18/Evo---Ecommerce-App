import 'package:evo_mart/model/wishlist_model/wishlist_model.dart';
import 'package:evo_mart/services/wishlist/wishlist_services.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:evo_mart/view/product_screen/product_view.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  bool isLoading = false;
  WishListModel? model;
  List<dynamic> wishList = [];
  WishlistService service = WishlistService();

  WishlistProvider(context) {
    getWishlist(context);
  }

  void getWishlist(context) async {
    isLoading = true;
    notifyListeners();
    await service.getWishlist(context).then(
      (value) {
        if (value != null) {
          model = value;
          notifyListeners();
          wishList = model!.products.map((e) => e.product.id).toList();
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

  void addOrRemoveFromWishlist(context, String productId) async {
    isLoading = true;
    notifyListeners();
    await service.addOrRemoveWishlist(context, productId).then((value) {
      if (value != null) {
        service.getWishlist(context).then((value) {
          if (value != null) {
            model = value;
            notifyListeners();
            getWishlist(context);
            isLoading = false;
            notifyListeners();
          } else {
            isLoading = false;
            notifyListeners();
          }
        });
        if (value == 201) {
          SnackBarPop.popUp(context, 'Item added to Wishlist ', Colors.green);
        }
        if (value == 204) {
          SnackBarPop.popUp(context, 'Item removed from Wishlist ', Colors.red);
        }
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  WishListModel findById(String id) {
    return wishList.firstWhere((element) => element.id == id);
  }

  void toProductScreen(context, index) {
    Navigator.of(context)
        .pushNamed(ProductView.routeName, arguments: wishList[index]);
  }
}
