import 'dart:developer';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/view/order_placed_screen/order_placed_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class PaymentProvider extends ChangeNotifier {
  Razorpay razorpay = Razorpay();

  void openCheckout(price,context) async {
    var options = {
      'key': 'rzp_test_boWotLKxahxvUM',
      'amount': price * 100,
      'name': 'EvoCart',
      'description': 'Mobile Phones',
      'prefill': {'contact': '9961735029', 'email': 'Evo@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    notifyListeners();
    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        handlePaymentSuccess(response);
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse resp) {
        handlePaymentError(resp);
      });
      notifyListeners();
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS:${response.paymentId}", timeInSecForIosWeb: 4);
    notifyListeners();
    // PopUpSnackBar.popUp(context, "SUCCESS:${response.paymentId}", greyColor);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR:${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
    notifyListeners();

    // PopUpSnackBar.popUp(
    //     context, "ERROR:${response.code} - ${response.message}", greyColor);
  }

  void handleExternalWallet(ExternalWalletResponse response, context) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET:${response.walletName}", timeInSecForIosWeb: 4);
    notifyListeners();

    // PopUpSnackBar.popUp(
    //     context, "EXTERNAL_WALLET:${response.walletName}", greyColor);
  }
}
// class PaymentProvider extends ChangeNotifier {
//   bool isLoading = false;
//   String paymentType = 'Online Payment';
//   List<Product> products = [];
//   Map<String, dynamic> options = {};
//   List<String>? productId;
//   String? addressId;

//   Razorpay razorpay = Razorpay();

//   void openCheckout( payableAmount) {
//     options = {
//       "key": "rzp_test_boWotLKxahxvUM",
//       "amount": payableAmount * 100,
//       "name": "Evo-Cart",
//       "description": "Mobile Phones",
//       "prefill": {"contact": "8848066170", "email": "evo@gmail.com"},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//     notifyListeners();
//     try {
//       razorpay.open(options);
//       log('razorpay open');
//       razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
//           (PaymentSuccessResponse response) {
//             Fluttertoast.showToast(msg: "Payment Success${response.paymentId}",backgroundColor: Colors.green);
      
//       });
//       notifyListeners();
//     } on PaymentFailureResponse catch (e) {
//       log(e.message.toString());
//     }
//   }

//   // payment handlers.
//   void handlerPaymentSuccess(PaymentSuccessResponse response, context) {
//     orderProducts(addressId!, paymentType, context);
//     log("Pament success");
//               Fluttertoast.showToast(msg: "Payment Success${response.paymentId}",backgroundColor: Colors.green);

//     notifyListeners();
//   }

//   void handlerErrorFailure(PaymentFailureResponse response, context) {
//     log("Pament error");
//                 Fluttertoast.showToast(msg: "Payment Success${response.code}",backgroundColor: Colors.red);

//     notifyListeners();
//   }

//   void handlerExternalWallet(context) {
//     log("External Wallet");
//                 Fluttertoast.showToast(msg: "Payment Wallet",backgroundColor: Colors.red);


//     notifyListeners();
//   }

//   //------------------------------------------------------------------

// // function for payment of products.
//   Future<void> orderProducts(String addressId, paymentType, context) async {
//     isLoading = true;
//     notifyListeners();
//     final OrdersModel model = OrdersModel(
//       addressId: addressId,
//       paymentType: paymentType,
//       products: products,
//     );
//     await OrderService().placeOrder(model, context).then((value) {
//       if (value != null) {
//         isLoading = false;
//         notifyListeners();
//         final OrderArgumnetsModel args = OrderArgumnetsModel(orderId: value);
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) {
//               return OrderPlacedScreen(
//                 args: args,
//               );
//             },
//           ),
//         );
//       } else {
//         isLoading = false;
//         notifyListeners();
//       }
//     });
//   }

//   //---------------------------------------------------------------------
// }
