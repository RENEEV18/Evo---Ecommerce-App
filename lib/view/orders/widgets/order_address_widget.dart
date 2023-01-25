import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/view/address/show_address_page.dart';
import 'package:evo_mart/view/profile_screen/widgets/profile_listtile_widget.dart';
import 'package:flutter/material.dart';

class OrderAddressWidget extends StatelessWidget {
  const OrderAddressWidget({
    Key? key,
    required this.index,
    required this.value,
  }) : super(key: key);

  final int index;
  // final dynamic value;
  final AddressProvider value;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: kWhite,
      child: Column(
        children: [
          ProfileListtileWidget(
            text: 'Deliver to :',
            size: 16,
            ontap: () {},
            trailIcon: SizedBox(
              height: 32,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ShowAddressScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhite,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: kgery),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Change',
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSize,
                Row(
                  children: [
                    Text(
                      value.addressList[index].fullName.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: "Manrope",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kWidth,
                    Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Text(
                        value.addressList[index].title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Manrope",
                          fontSize: 14,
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            // value.deleteAddress(
                            //     value.addressList[index].id, context);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  value.addressList[index].address,
                  style: const TextStyle(
                    fontFamily: "Manrope",
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "PIN :${value.addressList[index].pin}, ",
                      style: const TextStyle(
                        fontFamily: "Manrope",
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      value.addressList[index].state,
                      style: const TextStyle(
                        fontFamily: "Manrope",
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  value.addressList[index].place,
                  style: const TextStyle(
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                kSize,
                Text(
                  value.addressList[index].phone,
                  style: const TextStyle(
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                kSize,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
