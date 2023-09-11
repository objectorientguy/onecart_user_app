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
    return  Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(smallCardCurve),
              topRight: Radius.circular(smallCardCurve),
              bottomLeft:
              Radius.circular(smallCardCurve),
              bottomRight:
              Radius.circular(smallCardCurve))),
      child: Padding(
        padding: const EdgeInsets.all(tinierSpacing),
        child: Column(
          children: [
            Row(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColor.lighterRed,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,
                          AddAddressScreen.routeName,
                          arguments: false);
                    },
                    child: Text(
                      'Add New Address',
                      style: Theme.of(context)
                          .textTheme
                          .xxSmall
                          .copyWith(
                          color:
                          AppColor.lighterRed,
                          fontWeight:
                          FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                      width: kBottomBarWidth),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: xxTinySpacing,
                  ),
                ]),
            const Divider(height: xxxSmallestSpacing),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.my_location,
                  color: AppColor.lighterRed,
                ),
                const SizedBox(width: xxTiniestSpacing),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          CurrentLocation.routeName,
                        );
                      },
                      child: Text(
                        'Use Your Current Location',
                        style: Theme.of(context)
                            .textTheme
                            .xxSmall
                            .copyWith(
                            color:
                            AppColor.lighterRed,
                            fontWeight:
                            FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: xxTiniestSpacing,
                      width: xxxTinierSpacing,
                    ),
                    Text(
                      'Tatya Tope Nagar, Deo,Nagpur',
                      style: Theme.of(context)
                          .textTheme
                          .xxGSmall
                          .copyWith(
                          color: AppColor.black),
                    ),
                  ],
                ),
                const SizedBox(width: xxLargeSpacing),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: xxTinySpacing,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
