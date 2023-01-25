import 'dart:developer';
import 'package:evo_mart/model/address/get_address.dart';
import 'package:evo_mart/model/cart/get_single_model.dart';
import 'package:evo_mart/model/orders/get_orders_model.dart';
import 'package:evo_mart/services/address/address_service.dart';
import 'package:evo_mart/services/cart/cart_services.dart';
import 'package:evo_mart/services/orders/orders_service.dart';
import 'package:evo_mart/view/orders/model/order_screen_enum.dart';
import 'package:evo_mart/view/orders/orders_page.dart';
import 'package:flutter/material.dart';

class OrdersProvider extends ChangeNotifier {
  bool isLoading = false;

  List<GetOrderModel> orderList = [];
  GetOrderModel? getSingleOrder;
  GetAddressModel? addressModel;
  List<GetSingelCartProduct> cartModel = [];
  int? totalSave;

  void getAllOrders(context) async {
    isLoading = true;
    notifyListeners();
    await OrderService().getAllOrders(context).then((value) {
      if (value != null) {
        orderList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
    return null;
  }

  void getSingleOrders(context, String orderId) async {
    isLoading = true;
    notifyListeners();
    await OrderService().getSingleOrders(context, orderId).then((value) {
      if (value != null) {
        getSingleOrder = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
    return null;
  }

  void cancelOrders(context, String orderId) async {
    isLoading = true;
    notifyListeners();
    await OrderService().cancelOrder(context, orderId).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
    return null;
  }

  void getSingleAddress(context, String addressId) async {
    isLoading = false;
    notifyListeners();
    await AddressService().getSingleAddress(context, addressId).then((value) {
      if (value != null) {
        log("message");

        addressModel = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
    return null;
  }

  void getSingleCart(context, String productId, String cartId) async {
    isLoading = false;
    notifyListeners();
    await CartService().getSingleCart(context, productId, cartId).then((value) {
      if (value != null) {
        cartModel = value;
        notifyListeners();
        totalSave = (cartModel[0].price - cartModel[0].discountPrice).round();
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
    return null;
  }

  void toOrderScreen(context, productId, cartId) {
    getSingleCart(
      context,
      productId,
      cartId,
    );
    notifyListeners();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return OrderPageScreen(
            cartId: cartId,
            productId: productId,
            screenCheck:
                OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen);
      },
    ));
  }
}
