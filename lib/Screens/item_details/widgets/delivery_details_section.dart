import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class DeliverDetailsSection extends StatelessWidget {
  const DeliverDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List deliveryData = [
      {'title': '7 day returns', 'image': 'assets/return.png'},
      {'title': 'Same day shipping', 'image': 'assets/time.png'},
      {'title': 'Cancellable', 'image': 'assets/cancellation.png'},
    ];
    return SizedBox(
      height: kDeliveryBox,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: deliveryData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(leftRightMargin),
            width: kHorizontalCategoryListHeight,
            decoration: BoxDecoration(
              //color: AppColor.paleGreen,
              borderRadius: BorderRadius.circular(kDelivery),
              border:
                  Border.all(color: AppColor.primary, width: kDeliveryWidth),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Center(
                        child: Container(
                            height: kCacheImageHeight,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              deliveryData[index]['image'],
                              color: AppColor.primary,
                              height: kImage,
                            )))),
                SizedBox(
                    child: Text(
                  deliveryData[index]['title'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.xxTinier.copyWith(
                        color: AppColor.primary,
                      ),
                )),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: tinySpacing);
        },
      ),
    );
  }
}
