import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/address_model/address_model.dart';

class EditAddressScreen extends StatelessWidget {
  static const routeName = 'EditAddressScreen';
  final AddressDatum addressDataMap;
  const EditAddressScreen({Key? key, required this.addressDataMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController laneController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController pinController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    laneController.value =
        TextEditingValue(text: addressDataMap.addressName.toString());
    cityController.value =
        TextEditingValue(text: addressDataMap.addressType.toString());
    titleController.value =
        TextEditingValue(text: addressDataMap.phoneNo.toString());
    pinController.value =
        TextEditingValue(text: addressDataMap.state.toString());
    phoneController.value =
        TextEditingValue(text: addressDataMap.pincode.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit address',
            style: Theme.of(context).textTheme.headingMedium),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: xxxTinierSpacing),
            TextField(
              controller: laneController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: xxxTinierSpacing),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: xxxTinierSpacing),
            Row(
              children: [
                SizedBox(
                    width: (MediaQuery.of(context).size.width -
                            (2 * leftRightMargin) -
                            xxxTinierSpacing) /
                        2,
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kGeneralBorderRadius),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    )),
                const SizedBox(width: xxxTinierSpacing),
                SizedBox(
                    width: (MediaQuery.of(context).size.width -
                            (2 * leftRightMargin) -
                            xxxTinierSpacing) /
                        2,
                    child: TextField(
                      controller: pinController,
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kGeneralBorderRadius),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: smallSpacing),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'SAVE',
                        style: Theme.of(context).textTheme.textButtonLarger,
                      )),
                ),
                // Expanded(
                //   child: ElevatedButton(
                //       onPressed: () {},
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor: AppColor.lighterGrey,
                //           minimumSize: const Size(
                //               double.maxFinite, kElevatedButtonHeight),
                //           shape: RoundedRectangleBorder(
                //               borderRadius:
                //                   BorderRadius.circular(kGeneralBorderRadius))),
                //       child: Text(
                //         'CANCEL',
                //         style: Theme.of(context)
                //             .textTheme
                //             .textButtonLarger
                //             .copyWith(color: AppColor.darkerGrey),
                //       )),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
