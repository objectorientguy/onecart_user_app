import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/orders/widgets/order_placed_tile.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = 'WishlistScreen';

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'WishList',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(
          children: [
            SizedBox(
              height: kImage,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        borderRadius: BorderRadius.circular(kEditRadius)),
                    padding: const EdgeInsets.symmetric(
                        vertical: tiniestSpacing,
                        horizontal: xxxSmallestSpacing),
                    child: const Text('Fruits'),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: tiniestSpacing,
                  );
                },
              ),
            ),
            const SizedBox(
              height: xxxSmallestSpacing,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const OrderPlacedTile();
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        height: xxxSmallestSpacing,
                      ),
                  itemCount: 8),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.9),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.paleFaintGrey,
                          borderRadius: BorderRadius.circular(8)),
                      width: kHorizontalCategoryListItemWidth,
                      child: Column(
                        children: [
                          Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(tiniestSpacing),
                                  child: Container(
                                      height: kCardHeightItem,
                                      width: kWidth,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              kBorderRadiusSmall)),
                                      child: Image.asset('assets/img_2.png',
                                          fit: BoxFit.fill)))),
                          SizedBox(
                              width: 100,
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
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
