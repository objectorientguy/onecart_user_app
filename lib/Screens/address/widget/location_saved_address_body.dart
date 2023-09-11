import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/address_model/address_model.dart';
import '../edit_address_screen.dart';

class LocationSavedAddressBody extends StatelessWidget {
  final List<AddressDatum> addressData;

  const LocationSavedAddressBody({super.key, required this.addressData});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: addressData.length,
          separatorBuilder: (context, index) =>
              const Divider(height: smallestSpacing),
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: xxTiniestSpacing),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, EditAddressScreen.routeName,
                        arguments: addressData[index]);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: xMediumSpacing,
                                  width: xMediumSpacing,
                                  decoration: const BoxDecoration(),
                                  child: const Icon(Icons.home_outlined,
                                      size: xxxSmallestSpacing,
                                      color: AppColor.mediumBlack))
                            ]),
                        const SizedBox(width: xxTinierSpacing),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(addressData[index].addressType.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .textMedium
                                      .copyWith(fontWeight: FontWeight.w500)),
                              const SizedBox(width: xxTinierSpacing),
                              const SizedBox(height: xxxTiniestSpacing),
                              Text(addressData[index].addressName.toString(),
                                  style: Theme.of(context).textTheme.xxGSmall)
                            ])
                      ]),
                ));
          }),
      const SizedBox(height: tinySpacing),
      Text("Recent location", style: Theme.of(context).textTheme.headingTiny),
      const SizedBox(height: xxxTinierSpacing),
      Card(
          child: Padding(
              padding: const EdgeInsets.all(xxTinierSpacing),
              child: Row(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: xMediumSpacing,
                                width: xMediumSpacing,
                                decoration: const BoxDecoration(),
                                child: const Icon(Icons.home_outlined,
                                    size: smallestSpacing,
                                    color: AppColor.mediumBlack))
                          ]),
                      const SizedBox(width: xxTinierSpacing),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(addressData[0].addressType.toString(),
                                style: Theme.of(context).textTheme.headingTiny),
                            const SizedBox(width: xxTinierSpacing),
                            const SizedBox(height: xxxTiniestSpacing),
                            Text(addressData[0].addressName.toString(),
                                style: Theme.of(context).textTheme.xxGSmall)
                          ])
                    ])
              ])))
    ]);
  }
}
