// import 'package:evo_mart/model/cart/add_to_cart_model.dart';
// import 'package:evo_mart/services/cart/cart_services.dart';
// import 'package:flutter/cupertino.dart';

// class CartProvider extends ChangeNotifier{
//   bool isLoading = false;
//   CartModel? cartList;
//   List<String> cartItemsId = [];
//   CartService service = CartService();




//   void addToCart(context,String id, int quantity, String size)async{
//    final CartModel model = CartModel(productId: id, quantity: quantity, size: size);
//   await service.addToCart(model, context).then((value) {
//     if(value!=null){
     
//     }
//    },);
//   }

//   void getCartItems(context)async{
//     isLoading = true;
//     notifyListeners();
//     await service.getCart(context).then((value) {
//     if(value!=null){
//       cartList = value;
//       notifyListeners();
//       cartItemsId = cartList!.productId.
//     }
//     },);
//   }
// }