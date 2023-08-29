import 'package:flutter/material.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/search_product/search_product_model.dart';
import '../../categories/category_item_screen.dart';

class HorizontalBrandList extends StatelessWidget {
  final List<Brand> data;

  const HorizontalBrandList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHorizontalCategoryListHeight,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
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
                    arguments: data[index]);
              },
              child: Column(
                children: [
                  Container(
                    height: kHorizontalCategoryListItemWidth,
                    width: kHorizontalCategoryListItemWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data[index].brandImage!)),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: kHorizontalCategoryListItemWidth * 1.2,
                    child: Text(
                      data[index].brandName!,
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
