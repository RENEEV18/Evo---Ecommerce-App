import 'dart:developer';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:evo_mart/model/cart/add_to_cart_model.dart';
import 'package:evo_mart/model/cart/cart_to_orders_model.dart';
import 'package:evo_mart/model/cart/get_cart_model.dart';
import 'package:evo_mart/services/cart/cart_services.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:evo_mart/view/bottom_nav.dart';
import 'package:evo_mart/view/orders/model/order_screen_enum.dart';
import 'package:evo_mart/view/orders/orders_page.dart';
import 'package:evo_mart/view/product_screen/product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  CartProvider(context) {
    getCart(context);
  }

  bool isLoading = false;
  CartModel? cartList;
  List<String> cartItemsId = [];
  int quantity = 1;
  int totalproductCount = 1;
  int? totalSave;
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
          totalSave = (cartList!.totalPrice - cartList!.totalDiscount).toInt();
          totalProductCount();
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
        }
        return null;
      },
    );
  }

  void addToCart(String productId, context, String size) async {
    log('here');
    isLoading = true;
    notifyListeners();
    final AddToCartModel model = AddToCartModel(
      size: size.toString(),
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
      } else {
        null;
      }
    });
  }

  void removeCart(context, productId) {
    log('get in to remove controller');
    service.removeFromCart(context, productId).then(
      (value) {
        if (value != null) {
          getCart(context);
          log(totalSave.toString());
          pop(context);
          SnackBarPop.popUp(
              context, 'Product removed from cart successfully', kRed);
          notifyListeners();
        } else {
          return;
        }
      },
    );
  }

  void totalProductCount() {
    int count = 0;
    for (var i = 0; i < cartList!.products.length; i++) {
      count = count + cartList!.products[i].qty;
    }
    totalproductCount = count;
    notifyListeners();
  }

  Future<void> incrementDecrementQty(int qty, String productId,
      int productQuantity, context, String size) async {
    final AddToCartModel model = AddToCartModel(
      size: size.toString(),
      quantity: quantity,
      productId: productId,
    );
    if (qty == 1 && productQuantity >= 1) {
      await CartService().addToCart(model, context).then(
        (value) async {
          if (value != null) {
            await CartService().getCart(context).then(
              (value) {
                if (value != null) {
                  cartList = value;
                  notifyListeners();
                  totalProductCount();
                  cartItemsId =
                      cartList!.products.map((e) => e.product.id).toList();
                  notifyListeners();
                  totalSave = cartList!.totalDiscount.toInt() -
                      cartList!.totalPrice.toInt();
                  notifyListeners();
                } else {
                  null;
                }
              },
            );
          } else {
            null;
          }
        },
      );
    }
  }

  void gotToCartFromProduct(context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return const BottomNav();
      },
    ), (route) => false);
    Provider.of<BottomNavProvider>(context, listen: false).currentIndex = 2;
    notifyListeners();
  }

  void toProductScreen(context, index) {
    Navigator.of(context)
        .pushNamed(ProductView.routeName, arguments: cartItemsId[index]);
  }

  void pop(context) {
    Navigator.of(context).pop();
    notifyListeners();
  }

//   void gotoOrdersScreen(OrderSummaryScreenEnum screenCheck,String? cartId,String? productId,context){
//  final args = CarttoOrderScreenArguementModel(
//       screenCheck: screenCheck,
//       cartId: cartId,
//       productId: productId,
//       // visibility: true,
      
//     );
//       Navigator.of(context).pushNamed(
//       OrderPageScreen.routeName,
//       arguments: args,
//     );
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return const  OrderPageScreen();
    // },));
  }

