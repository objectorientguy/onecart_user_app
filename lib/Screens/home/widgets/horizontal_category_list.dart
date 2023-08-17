import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../categories/category_item_screen.dart';

class HorizontalCategoryList extends StatelessWidget {
  const HorizontalCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List categoryData = [
      {'name': 'Fruits & Vegetables', 'Image': 'assets/img.png'},
      {'name': 'Staples', 'Image': 'assets/imgC2.png'},
      {'name': 'Dairy and Bakery', 'Image': 'assets/imgC3.png'},
      {'name': 'Snacks & Branded Fruits', 'Image': 'assets/imgC4.png'},
      {'name': 'Beverages', 'Image': 'assets/imgC5.png'},
      {'name': 'Premium Fruits', 'Image': 'assets/img.png'},
      {'name': 'Home Care', 'Image': 'assets/imgC5.png'},
      {'name': 'Personal Care', 'Image': 'assets/imgC2.png'},
      {'name': 'Breakfast & Instant Food', 'Image': 'assets/imgC3.png'},
      {'name': 'Home Care', 'Image': 'assets/imgC4.png'},
    ];
    return SizedBox(
      height: kHorizontalCategoryListHeight,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 0 || index == 11) {
            return const SizedBox(
              width: xxxTinierSpacing,
            );
          }
          return SizedBox(
            width: kHorizontalCategoryListItemWidth * 1.2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, CategoryItemScreen.routeName,
                    arguments: false);
              },
              child: Column(
                children: [
                  Container(
                    height: kHorizontalCategoryListItemWidth,
                    width: kHorizontalCategoryListItemWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(categoryData[index - 1]['Image'])),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: kHorizontalCategoryListItemWidth * 1.2,
                    child: Text(
                      categoryData[index - 1]['name'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
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
