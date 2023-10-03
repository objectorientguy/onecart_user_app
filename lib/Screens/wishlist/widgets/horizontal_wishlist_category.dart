import 'package:flutter/material.dart';
import 'package:onecart_user_app/data/models/wishlist/view_wishlist_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class WishlistCategory extends StatelessWidget {
  final Categories wishlistCategory;
  const WishlistCategory({super.key, required this.wishlistCategory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kImage,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary),
                borderRadius: BorderRadius.circular(kEditRadius)),
            padding: const EdgeInsets.symmetric(
                vertical: tiniestSpacing, horizontal: xxxSmallestSpacing),
            child: Text(wishlistCategory.beverages.toString()),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: tiniestSpacing,
          );
        },
      ),
    );
  }
}
