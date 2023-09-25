import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/data/models/orders/order_details_model.dart';
import '../Screens/orders/widgets/order_details_row_widget.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class OderDetailExpansionTile extends StatelessWidget {
  final OrderDetails orderData;
  const OderDetailExpansionTile({super.key, required this.orderData});

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
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * kMediaQuerrySize,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: topBottomPadding,
                            vertical: xxxTiniestSpacing),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OrderDetailRowWidget(
                                orderData: orderData.userName, name: 'Name'),
                            const Divider(color: AppColor.grey),
                            OrderDetailRowWidget(
                                orderData: orderData.orderNumber,
                                name: 'Order Number'),
                            const Divider(color: AppColor.grey),
                            OrderDetailRowWidget(
                                orderData: DateFormat.yMMMMd()
                                    .format(orderData.orderDate),
                                name: 'Order Date'),
                            const Divider(color: AppColor.grey),
                            OrderDetailRowWidget(
                                orderData:
                                    "₹ ${orderData.productTotal.toString()}",
                                name: 'Product Total'),
                            const Divider(color: AppColor.grey),
                            OrderDetailRowWidget(
                                orderData:
                                    "₹ ${orderData.orderAmount.toString()}",
                                name: 'Order Amount'),
                            const Divider(color: AppColor.grey),
                            OrderDetailRowWidget(
                                orderData:
                                    "₹ ${orderData.deliveryFees.toString()}",
                                name: 'Delivery Fee'),
                            const Divider(color: AppColor.grey),
                            OrderDetailRowWidget(
                                orderData: orderData.invoiceNumber.toString(),
                                name: 'Invoice Number'),
                            const Divider(color: AppColor.grey),
                            OrderDetailRowWidget(
                                orderData:
                                    "₹ ${orderData.invoiceAmount.toString()}",
                                name: 'Invoice Amount')
                          ],
                        ))))
          ]),
    );
  }
}
