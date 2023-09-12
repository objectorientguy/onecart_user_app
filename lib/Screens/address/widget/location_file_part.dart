import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../add_address_screen.dart';
import 'current_location.dart';

class LocationCardTile extends StatelessWidget {
  const LocationCardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(smallCardCurve))),
      child: Padding(
        padding: const EdgeInsets.all(tinierSpacing),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AddAddressScreen.routeName,
                    arguments: false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Icon(
                      Icons.add,
                      color: AppColor.primary,
                    ),
                    const SizedBox(width: xxTinierSpacing),
                    Text(
                      'Add New Address',
                      style: Theme.of(context).textTheme.xTinier.copyWith(
                          color: AppColor.primary, fontWeight: FontWeight.w600),
                    ),
                  ]),
                  const Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: xxTinySpacing,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: xxSmallestSpacing),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CurrentLocation.routeName,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.my_location,
                        color: AppColor.primary,
                      ),
                      const SizedBox(width: xxTinierSpacing),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Use Your Current Location',
                            style: Theme.of(context).textTheme.xTinier.copyWith(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: xxTiniestSpacing,
                            width: xxxTinierSpacing,
                          ),
                          Text(
                            'Tatya Tope Nagar, Deo,Nagpur',
                            style: Theme.of(context)
                                .textTheme
                                .xxxTinier
                                .copyWith(color: AppColor.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: xxTinySpacing,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
