import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider extends ChangeNotifier {
  bool isLoading = false;
  Razorpay razorpay = Razorpay();
}
