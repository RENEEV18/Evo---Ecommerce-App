import 'package:evo_mart/view/orders/model/order_screen_enum.dart';

class CarttoOrderScreenArguementModel {
  final OrderSummaryScreenEnum screenCheck;
  final String? cartId;
  final String? productId;
  // final bool visibility;
  CarttoOrderScreenArguementModel({
    required this.screenCheck,
    this.cartId,
    this.productId,
    // this.visibility = false,
  });
}
