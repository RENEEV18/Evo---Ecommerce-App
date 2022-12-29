import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My Cart',
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Manrope",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child:
            Consumer2<HomeProvider, CartProvider>(
                builder: (context, home, wish, child) {
          return Column(
            children: [
              kGapSize,
              ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return wish.isLoading == true
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.height / 2,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : wish.cartList == null || wish.cartList!.products.isEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: const Center(
                                child: Text('Cart is Empty'),
                              ),
                            )
                          : ListTile(
                              leading: Container(
                                height: 65,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    // fit: BoxFit.cover,
                                    image: NetworkImage(
                                      '${ApiBaseUrl().baseUrl}/products/${wish.cartList!.products[index].product.image[0]}',
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: Text(
                                "₹${wish.cartList!.products[index].product.price}"
                                    .toString(),
                                style: const TextStyle(
                                  color: kRed,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              title: Text(
                                wish.cartList!.products[index].product.name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: wish.cartList?.products.length ?? 0,
              ),
            ],
          );
        })),
      ),
    );
  }
}
