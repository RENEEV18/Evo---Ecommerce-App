import 'package:carousel_slider/carousel_slider.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/product_screen_provider/product_screen_provider.dart';
import 'package:evo_mart/view/product_screen/widgets/bottom_widget.dart';
import 'package:evo_mart/view/product_screen/widgets/preview_product_widget.dart';
import 'package:evo_mart/view/product_screen/widgets/product_details_widget.dart';
import 'package:evo_mart/view/product_screen/widgets/top_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
  });

  static const routeName = '/product_view.dart';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final provider =
        Provider.of<HomeProvider>(context, listen: false).findById(productId);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<HomeProvider, ProductProvider>(
            builder: (context, value, value2, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    kSize,
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: provider.image.length,
                          itemBuilder: (context, index, realIndex) {
                            return value.isLoading == true
                                ? const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  )
                                : Center(
                                    child: Image(
                                      image: NetworkImage(
                                        'http://172.16.5.206:5005/products/${provider.image[index]}',
                                      ),
                                    ),
                                  );
                          },
                          options: CarouselOptions(
                            height: 250,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              value2.getProductCarousel(index);
                            },
                          ),
                        ),
                        TopItemWidget(
                          id: provider.id,
                        ),
                      ],
                    ),
                    kHeight,
                    AnimatedSmoothIndicator(
                      activeIndex: value2.activeIndex,
                      count: provider.image.length,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: kgery,
                        activeDotColor: kTextfieldColor,
                      ),
                    ),
                    kHeight,
                    PreviewProductWidget(image: provider.image),
                    kGapSize,
                    ProductDetailsWidget(
                      name: provider.name,
                      price: provider.price,
                      rating: provider.rating,
                    ),
                    kSize,
                    // BottomWidget(
                    //   id: provider.id,
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomItemWidgets(
        size: provider.size,
        id: provider.id,
        productId: provider.id,
      ),
    );
  }
}
