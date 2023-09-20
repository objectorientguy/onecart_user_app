import 'package:flutter/cupertino.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class WishlistCategory extends StatelessWidget {
  final List wishlistData;
  const WishlistCategory({super.key, required this.wishlistData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kImage,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: wishlistData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary),
                borderRadius: BorderRadius.circular(kEditRadius)),
            padding: const EdgeInsets.symmetric(
                vertical: tiniestSpacing, horizontal: xxxSmallestSpacing),
            child: Text(wishlistData[index]['title'].toString()),
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
