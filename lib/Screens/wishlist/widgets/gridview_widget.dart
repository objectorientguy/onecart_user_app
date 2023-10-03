import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../../blocs/wishlist_bloc/wishlist_events.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/wishlist/view_wishlist_model.dart';
import '../../home/widgets/counter_widget.dart';

class GridViewScreen extends StatelessWidget {
  final WishlistDatum wishlistData;

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
        itemCount: wishlistData.all.length,
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
                  right: xxxSmallestSpacing,
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
                                    wishlistData.all[index].image[index]
                                        .toString(),
                                    fit: BoxFit.fill))),
                        SizedBox(
                            width: kShopBox,
                            child: Text(wishlistData.all[index].productName,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTinier
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false)),
                        const SizedBox(
                          height: xxTinierSpacing,
                        ),
                        SizedBox(
                          width: kShopBox,
                          child: Text(
                            wishlistData.all[index].quantity,
                            style: Theme.of(context)
                                .textTheme
                                .tiniest
                                .copyWith(color: AppColor.primary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: xxxTiniestSpacing),
                        Text('₹${wishlistData.all[index].discountedCost}',
                            style: Theme.of(context)
                                .textTheme
                                .xxTinier
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.lightestGrey)),
                        const SizedBox(height: xxTiniestSpacing),
                        CounterScreen(
                          width: kGeneralWidth,
                          title: 'Add to Cart',
                          prodId: wishlistData.all[index].productId,
                          variantId: wishlistData.all[index].variantId,
                          height: 0,
                        ),
                      ]),
                ),
                InkWell(
                  onTap: () {
                    context.read<WishlistBloc>().add(DeleteWishlist(
                        deleteId:
                            wishlistData.all[index].productId.toString()));
                    context.read<WishlistBloc>().add(GetAllWishlistItems());
                  },
                  child: const Icon(Icons.close,
                      size: kIconSizeSmall, color: AppColor.grey),
                )
              ]),
            ),
          );
        });
  }
}
