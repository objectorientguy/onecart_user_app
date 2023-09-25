import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../common_widgets/button_widget.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/order_details_model.dart';

class OrderPlacedTile extends StatelessWidget {
  final String title;
  final Product orderProductData;

  const OrderPlacedTile(
      {super.key, required this.title, required this.orderProductData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.paleFaintGrey,
          borderRadius: BorderRadius.circular(smallCardCurve)),
      padding: const EdgeInsets.symmetric(
          vertical: xxxTinierSpacing, horizontal: xxxSmallestSpacing),
      child: Row(
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
                        child: Image.network(orderProductData.variants.image[0],
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
                                Expanded(
                                    child: Text(orderProductData.productName,
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderProductData.variants.quantity,
                                      style: Theme.of(context)
                                          .textTheme
                                          .tiniest
                                          .copyWith(color: AppColor.primary),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: xxxTiniestSpacing),
                                    Text(
                                        "₹ ${orderProductData.variants.quantity}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .xxTinier
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.lightestGrey)),
                                  ],
                                ),
                                SizedBox(
                                    width: kTextboxHeightSmall,
                                    child: ButtonWidget(title: title))
                              ])
                        ])))
          ]),
    );
  }
}
