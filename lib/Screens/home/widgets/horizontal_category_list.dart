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
    return SizedBox(
      height: kHorizontalCategoryListHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          if (index == 0 || index == 7) return const SizedBox();
          return SizedBox(
            width: kHorizontalCategoryListItemWidth,
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
                    decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('assets/img.png')),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: kHorizontalCategoryListItemWidth,
                    child: Text(
                      'Fruits & Vegetables',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: xxxTinySpacing);
        },
      ),
    );
  }
}
