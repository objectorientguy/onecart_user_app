import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class OderDetailScreenCardTwo extends StatelessWidget {
  List orderData = [];

  OderDetailScreenCardTwo({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryLightShade,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(smallCardCurve))),
      child: ExpansionTile(
          initiallyExpanded: true,
          backgroundColor: AppColor.white,
          title: Text('Order Details',
              style: Theme.of(context).textTheme.headingTiny),
          trailing: const Icon(Icons.keyboard_arrow_down),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderDiscount))),
          children: [
            const SizedBox(height: tinierSpacing),
            ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: orderData.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColor.grey),
                itemBuilder: (context, index) {
                  return SizedBox(
                      width:
                          MediaQuery.of(context).size.width * kMediaQuerrySize,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: topBottomPadding,
                              vertical: xxxTiniestSpacing),
                          child: Row(children: [
                            Expanded(
                                flex: 5,
                                child: Text(orderData[index]['title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headingTiny
                                        .copyWith(
                                            color: AppColor.darkGrey,
                                            fontWeight: FontWeight.w400))),
                            Expanded(
                              flex: 5,
                              child: Text(orderData[index]['status'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headingTiny
                                      .copyWith(fontWeight: FontWeight.w500)),
                            )
                          ])));
                })
          ]),
    );
  }
}
