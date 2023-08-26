import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/categories/widgets/stores_item_list.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class StoreList extends StatelessWidget {
  const StoreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        separatorBuilder: (context, index) {
          return const SizedBox(height: smallSpacing);
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SizedBox();
          }
          return Container(
            padding: const EdgeInsets.fromLTRB(leftRightMargin,
                topBottomPadding, leftRightMargin, xxxTinierSpacing),
            decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurStyle: BlurStyle.normal,
                color: AppColor.lightGrey,
                spreadRadius: kZero,
                blurRadius: 10,
              ),
            ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: kCircleAvatarRadius,
                          backgroundImage: AssetImage('assets/img.png'),
                        ),
                        const SizedBox(
                          width: xxxTinierSpacing,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('BRP Foods Agro Store',
                                style:
                                    Theme.of(context).textTheme.headingSmall),
                            const SizedBox(
                              height: xxTiniestSpacing,
                            ),
                            Text(
                              '35-40 mins · Free Delivery',
                              style:
                                  Theme.of(context).textTheme.subHeadingMedium,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.primary,
                    )
                  ],
                ),
                const SizedBox(
                  height: tinySpacing,
                ),
                // StoreItemList(),
              ],
            ),
          );
        });
  }
}
