import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../common_widgets/button_widget.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/wishlist/view_wishlist_model.dart';

class ListViewScreen extends StatelessWidget {
  final List<WishlistData> wishlistData;

  const ListViewScreen({super.key, required this.wishlistData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
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
                                  borderRadius: BorderRadius.circular(
                                      kBorderRadiusSmall)),
                              child: Image.network(
                                  wishlistData[index].image[0].toString(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                          wishlistData[index].productName,
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
                            Row(children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: kTextboxHeightSmall,
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
                                ],
                              ),
                              const ButtonWidget(
                                title: 'Add to Cart',
                                showRatingScreen: true,
                              ),
                            ])
                          ]),
                    ),
                  )
                ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: xxxSmallestSpacing,
            ),
        itemCount: wishlistData.length);
  }
}
