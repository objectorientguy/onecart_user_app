import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';

class OrderDetailRowWidget extends StatelessWidget {
  const OrderDetailRowWidget({
    super.key,
    required this.orderData,
    required this.name,
  });

  final String orderData;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 5,
          child: Text(name,
              style: Theme.of(context).textTheme.tinier.copyWith(
                  color: AppColor.darkGrey, fontWeight: FontWeight.w400))),
      Expanded(
          flex: 5,
          child: Text(orderData,
              style: Theme.of(context)
                  .textTheme
                  .tinier
                  .copyWith(fontWeight: FontWeight.w400)))
    ]);
  }
}
