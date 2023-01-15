import 'dart:developer';

import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/model/orders/orders_model.dart';
import 'package:evo_mart/services/orders/orders_service.dart';
import 'package:evo_mart/services/payment/payment.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:evo_mart/view/orders/model/order_argument.dart';
import 'package:evo_mart/view/orders/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider extends ChangeNotifier {
  bool isLoading = false;
  String paymentType = 'Online Payment';
  List<Product> products = [];
  Map<String, dynamic> options = {};
  List<String>? productId;
  String? addressId;

  Razorpay razorpay = Razorpay();

  void totalAmount(List<String> productId, amount, address) async {
    final totalAmount = "${(num.parse(amount) * 100)}";
    final payableAmount = totalAmount.toString();
    openCheckout(payableAmount);
    products = productId.map((e) => Product(id: e)).toList();
    addressId = address;
    notifyListeners();
  }

  void openCheckout(String payableAmount) {
    options = {
      "key": "[YOUR_API_KEY]",
      "amount": payableAmount,
      "name": "Evo-Cart",
      "description": "Mobile Phones",
      "prefill": {"contact": "8848066170", "email": "evo@gmail.com"},
    };
    notifyListeners();
  }

  void orders(context) async {
    if (paymentType == 'Cash On Delivery') {
      await payProducts(addressId!, 'COD', context);
    } else if (paymentType == 'Online Payment') {
      PaymentService().razorpayPayment(razorpay, options, context);
    }
  }

  // payment handlers.
  void handlerPaymentSuccess(PaymentSuccessResponse response, context) {
    log("Pament success");
    payProducts(addressId!, "ONLINE_PAYMENT", context);
  }

  void handlerErrorFailure(PaymentFailureResponse response, context) {
    log("Pament error");
    SnackBarPop.popUp(context, 'Payment Cancelled', kRed);
  }

  void handlerExternalWallet(context) {
    log("External Wallet");
    SnackBarPop.popUp(context, 'Externall Wallet', Colors.green);
  }

  //------------------------------------------------------------------

// function for payment of products.
  Future<void> payProducts(String addressId, paymentType, context) async {
    isLoading = true;
    notifyListeners();
    final OrdersModel model = OrdersModel(
      addressId: addressId,
      paymentType: paymentType,
      products: products,
    );
    await OrderService().placeOrder(model, context).then((value) {
      if (value != null) {
        isLoading = false;
        notifyListeners();
        final OrderArgumnetsModel model = OrderArgumnetsModel(orderId: value);
        findByProduct(context, model);
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void findByProduct(context, model) {
    Navigator.of(context)
        .pushNamed(OrderPageScreen.routeName, arguments: model);
  }
  //---------------------------------------------------------------------
}
