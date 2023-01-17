import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/controller/providers/profile_provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowAddressScreen extends StatelessWidget {
  const ShowAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AddressProvider>(context, listen: false)
          .getAllAddress(context);
    });
    return Consumer2<ProfileProvider, AddressProvider>(
      builder: (context, value, value2, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Addresses",
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              value.goToAddAddressPage(context);
            },
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: kWhite,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return Container(
                        color: kWhite,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kSize,
                              Row(
                                children: [
                                  Text(
                                    value2.addressList[index].fullName
                                        .toUpperCase(),
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
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    child: Text(
                                      value2.addressList[index].title
                                          .toUpperCase(),
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
                                          value2.deleteAddress(
                                              value2.addressList[index].id,
                                              context);
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
                                value2.addressList[index].address,
                                style: const TextStyle(
                                  fontFamily: "Manrope",
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "PIN : ${value2.addressList[index].pin}, ",
                                    style: const TextStyle(
                                      fontFamily: "Manrope",
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    value2.addressList[index].state,
                                    style: const TextStyle(
                                      fontFamily: "Manrope",
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                value2.addressList[index].landMark,
                                style: const TextStyle(
                                  fontFamily: "Manrope",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              kSize,
                              Text(
                                value2.addressList[index].phone,
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
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kSize;
                    },
                    itemCount: value2.addressList.length,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
