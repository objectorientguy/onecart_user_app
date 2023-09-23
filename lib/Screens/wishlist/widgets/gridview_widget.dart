import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../common_widgets/button_widget.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/wishlist/view_wishlist_model.dart';

class GridViewScreen extends StatelessWidget {
  final List<WishlistData> wishlistData;

  const GridViewScreen({super.key, required this.wishlistData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: tinierSpacing,
            crossAxisSpacing: tinierSpacing,
            crossAxisCount: 2,
            childAspectRatio: 0.73),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: wishlistData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: AppColor.paleFaintGrey,
                borderRadius: BorderRadius.circular(kAddRadius)),
            width: kHorizontalCategoryListItemWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: xxTinierSpacing, vertical: xxTiniestSpacing),
              child: Stack(alignment: Alignment.topRight, children: [
                Positioned(
                  right: 20,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(tiniestSpacing),
                            child: Container(
                                height: kCardHeightItem,
                                width: kWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kBorderRadiusSmall)),
                                child: Image.network(
                                    wishlistData[index].image[0].toString(),
                                    fit: BoxFit.fill))),
                        SizedBox(
                            child: Text(wishlistData[index].productName,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTinier
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false)),
                        const SizedBox(
                          height: xxTinierSpacing,
                        ),
                        SizedBox(
                          child: Text(
                            wishlistData[index].quantity,
                            style: Theme.of(context)
                                .textTheme
                                .tiniest
                                .copyWith(color: AppColor.primary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: xxxTiniestSpacing),
                        Text('₹${wishlistData[index].discountedCost}',
                            style: Theme.of(context)
                                .textTheme
                                .xxTinier
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.lightestGrey)),
                        const SizedBox(height: xxTiniestSpacing),
                        const ButtonWidget(
                          title: 'Add to Cart',
                        )
                      ]),
                ),
                const Icon(Icons.close,
                    size: kIconSizeSmall, color: AppColor.grey)
              ]),
            ),
          );
        });
  }
}
