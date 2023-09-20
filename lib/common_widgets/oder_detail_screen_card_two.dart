import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';
import '../data/models/orders/order_details_model.dart';

class OderDetailExpansionTile extends StatelessWidget {
  // final List orderData;
  final OrderData data;
  const OderDetailExpansionTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryLightShade,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(smallCardCurve))),
      child: ExpansionTile(
          initiallyExpanded: true,
          backgroundColor: AppColor.white,
          title:
              Text('Order Details', style: Theme.of(context).textTheme.xxTiny),
          trailing: const Icon(Icons.keyboard_arrow_down),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderDiscount))),
          children: [
            const SizedBox(height: tinierSpacing),
            Padding(
              padding: const EdgeInsets.only(left: kZero),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (context, index) =>
                      const Divider(color: AppColor.grey),
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width *
                            kMediaQuerrySize,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: topBottomPadding,
                                vertical: xxxTiniestSpacing),
                            child: Row(children: [
                              Expanded(
                                  flex: 5,
                                  child: Text(data.order.userName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .tinier
                                          .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                              Expanded(
                                flex: 5,
                                child: Text(data.order.orderAmount.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .tinier
                                        .copyWith(fontWeight: FontWeight.w500)),
                              )
                            ])));
                  }),
            )
          ]),
    );
  }
}
