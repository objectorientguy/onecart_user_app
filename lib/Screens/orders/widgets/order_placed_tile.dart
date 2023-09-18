import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class OrderPlacedTile extends StatelessWidget {
  const OrderPlacedTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(tiniestSpacing),
                    child: Container(
                        height: kCardHeightItem,
                        width: kWidth,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kBorderRadiusSmall)),
                        child: Image.asset('assets/img_2.png',
                            fit: BoxFit.fill)))),
            const SizedBox(width: xxxTinySpacing),
            Expanded(
              child: SizedBox(
                height: kHeight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: kSizedBoxWidth,
                                child: Text(
                                    'Lays American Style Cream and Onion Potato Chips ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxTinier
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false)),
                          ]),
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: kTextboxHeightSmall,
                              child: Text(
                                '196 gm',
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(color: AppColor.primary),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: xxxTiniestSpacing),
                            Text('₹29',
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTinier
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.lightestGrey)),
                          ],
                        ),
                        SizedBox(
                          height: kImage,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: tinierSpacing,
                                  vertical: tiniestSpacing),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(kAddRadius)),
                              backgroundColor: AppColor.primary,
                            ),
                            child: Text('Add Review',
                                style: Theme.of(context)
                                    .textTheme
                                    .xxxTinier
                                    .copyWith(color: AppColor.white)),
                          ),
                        )
                      ])
                    ]),
              ),
            )
          ]),
      const Divider(
        thickness: kThickness,
        color: AppColor.primary,
      )
    ]);
  }
}
