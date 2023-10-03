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

class ListViewScreen extends StatelessWidget {
  final WishlistDatum wishlistData;

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
            child: Stack(children: [
              Row(
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
                                    wishlistData.all[index].image[index]
                                        .toString(),
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
                                    SizedBox(
                                        width: kGeneralBoxOne,
                                        child: Text(
                                            wishlistData.all[index].productName,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: kCardHeightItem,
                                            child: Text(
                                              wishlistData.all[index].quantity,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .tiniest
                                                  .copyWith(
                                                      color: AppColor.primary),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                              height: xxxTiniestSpacing),
                                          Text(
                                              '₹${wishlistData.all[index].discountedCost}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTinier
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor
                                                          .lightestGrey)),
                                        ]),
                                    CounterScreen(
                                      width: kGeneralWidth,
                                      title: 'Add to Cart',
                                      prodId: wishlistData.all[index].productId,
                                      variantId:
                                          wishlistData.all[index].variantId,
                                      height: 0,
                                    ),
                                  ])
                            ]),
                      ),
                    )
                  ]),
              Positioned(
                right: kZero,
                child: InkWell(
                  onTap: () {
                    context.read<WishlistBloc>().add(DeleteWishlist(
                        deleteId:
                            wishlistData.all[index].productId.toString()));
                    context.read<WishlistBloc>().add(GetAllWishlistItems());
                  },
                  child: const Icon(Icons.close,
                      size: kIconSizeSmall, color: AppColor.grey),
                ),
              )
            ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: xxxSmallestSpacing,
            ),
        itemCount: wishlistData.all.length);
  }
}
