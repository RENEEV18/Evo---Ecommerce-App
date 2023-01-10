import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/view/orders/widgets/order_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPageScreen extends StatelessWidget {
  const OrderPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Summary",
          style: TextStyle(
            fontFamily: "Manrope",
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AddressProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OrderAddressWidget(
                        index: index,
                        value: value,
                      );
                    },
                    itemCount: value.addressList.length,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
