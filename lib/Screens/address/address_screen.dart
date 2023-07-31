import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import 'edit_address_screen.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = 'AddressScreen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List addressData = [
      {
        'name': 'Home',
        'isCurrent': true,
        'value': [
          '4976 Reynolds Valley',
          '90014',
          'Los Angeles',
          'California',
          '213-293-0083'
        ]
      },
      {
        'name': 'Work',
        'isCurrent': false,
        'value': [
          '2789 Lee Avenue',
          '08052',
          'Maple Shade',
          'New Jersey',
          '609-230-8821'
        ]
      },
      {
        'name': 'Address',
        'isCurrent': false,
        'value': [
          '663 Briarhill Lane',
          '44255',
          'Mantua',
          'Ohio',
          '937-251-2113'
        ]
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('My addresses',
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
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (context, index) => const Divider(
                  height: smallestSpacing,
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (index == 3) {
                return const SizedBox();
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: xxxTinierSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(addressData[index]['name'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headingTiny),
                                const SizedBox(width: xxxTinierSpacing),
                                (addressData[index]['isCurrent'])
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColor.primary,
                                        size: 15,
                                      )
                                    : const SizedBox()
                              ],
                            ),
                            const SizedBox(height: xxxTiniestSpacing),
                            Text(
                              '${addressData[index]['value'][0]} ${addressData[index]['value'][1]}',
                              style:
                                  Theme.of(context).textTheme.subHeadingLarge,
                            ),
                            Text(
                              '${addressData[index]['value'][2]} ${addressData[index]['value'][3]}',
                              style:
                                  Theme.of(context).textTheme.subHeadingLarge,
                            ),
                            Text(
                              addressData[index]['value'][4],
                              style: Theme.of(context)
                                  .textTheme
                                  .subHeadingLarge
                                  .copyWith(fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, EditAddressScreen.routeName,
                            arguments: addressData[index]);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'EDIT',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 14),
                          )),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
