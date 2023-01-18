import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressAlertWidget extends StatelessWidget {
  const AddressAlertWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context, address, child) {
      return AlertDialog(
        title: const Text(
          'Remove Item',
          style: TextStyle(
            fontFamily: "Manrope",
            letterSpacing: 1,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you sure want to delete address?',
          style: TextStyle(
            fontFamily: "Manrope",
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          FittedBox(
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    address.deleteAddress(
                      address.addressList[index].id,
                      context,
                    );
                    Navigator.of(context).pop();
                    SnackBarPop.popUp(
                        context, "Address Removed Successfully", kRed);
                    address.getAllAddress(context);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
