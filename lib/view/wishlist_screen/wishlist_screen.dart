import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Wishlist',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child:
            Consumer2<HomeProvider, WishlistProvider>(
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
                      : wish.model == null || wish.model!.products.isEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: const Center(
                                child: Text('Wishlist is Empty'),
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
                                      '${ApiBaseUrl().baseUrl}/products/${wish.model!.products[index].product.image[0]}',
                                    ),
                                  ),
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.bookmark_remove),
                              ),
                              subtitle: Text(
                                "₹${wish.model!.products[index].product.price}"
                                    .toString(),
                                style: TextStyle(
                                  color: kRed,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              title: Text(
                                wish.model!.products[index].product.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.bold),
                              ),
                              // title: Image(image: NetworkImage('http://172.16.5.206:5005/uploads/products/${}}')),
                            );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: wish.model?.products.length ?? 0,
                // itemCount: wish.model?.products.length,
              ),
            ],
          );
        })),
      ),
    );
  }
}
