import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../Screens/address/edit_address_screen.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';
import '../data/models/address_model/address_model.dart';

class AddressTile extends StatelessWidget {
  final String typeAddress;
  final String nameAddress;
  final String phoneNumber;
  final AddressDatum addressDetail;
  const AddressTile({super.key, required this.typeAddress, required this.nameAddress, required this.phoneNumber, required this.addressDetail});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: kSizedBoxHeightSmall,
                width: kSizedBoxHeightSmall,
                decoration: const BoxDecoration(
                    color: AppColor.primaryLighter,
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: AppColor.primary,
                )),
            const SizedBox(
              width: xxxTinySpacing,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        typeAddress,
                        style: Theme.of(context)
                            .textTheme
                            .headingTiny),
                    const SizedBox(
                        width: xxTinierSpacing),
                  ],
                ),
                const SizedBox(
                    height: xxxTiniestSpacing),
                Text(
                  nameAddress,
                  style: Theme.of(context)
                      .textTheme
                      .subHeadingLargex,
                ),
                Text(
                  phoneNumber,
                  style: Theme.of(context)
                      .textTheme
                      .textMediumx,
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, EditAddressScreen.routeName,
                arguments: addressDetail);
          },
          child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: xxxTinierSpacing,
                  vertical: xxxTinierSpacing),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.green, width: 1.0),
                borderRadius: BorderRadius.circular(
                    kBottomNavBarRadius),
              ),
              child: Text(
                'EDIT',
                style: Theme.of(context)
                    .textTheme
                    .textMedium,
              )),
        ),
      ],
    );
  }
}
