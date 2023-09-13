import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.skyBlue,
          borderRadius: BorderRadius.circular(kBigRadius)),
      padding: const EdgeInsets.symmetric(
          vertical: xxTinierSpacing, horizontal: xxxTinySpacing),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Subtotal', style: Theme.of(context).textTheme.tinier),
            const SizedBox(height: xxxTinierSpacing),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('₹',
                  style: Theme.of(context)
                      .textTheme
                      .xxMedium
                      .copyWith(fontWeight: FontWeight.w100)),
              Text('2,199',
                  style: Theme.of(context)
                      .textTheme
                      .xxMedium
                      .copyWith(fontWeight: FontWeight.w700)),
              Text('.43',
                  style: Theme.of(context)
                      .textTheme
                      .xxTiny
                      .copyWith(color: AppColor.mediumBlack)),
              const SizedBox(
                width: xxxTinierSpacing,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.grey,
                    ),
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(kBigRadius)),
                padding: const EdgeInsets.symmetric(
                    vertical: xxTiniestSpacing, horizontal: xxTinierSpacing),
                child: Center(
                  child: Text('3 ITEMS',
                      style: Theme.of(context).textTheme.xxTinier.copyWith(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w500)),
                ),
              )
            ])
          ])
        ])
      ]),
    );
  }
}
