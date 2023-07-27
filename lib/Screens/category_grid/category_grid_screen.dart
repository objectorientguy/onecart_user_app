import 'package:flutter/material.dart';

import '../../common_widgets/address_bar.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../categories/category_item_screen.dart';

class CategoryFridScreen extends StatelessWidget {
  const CategoryFridScreen({Key? key}) : super(key: key);

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
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: Column(
              children: [
                const AddressBar(),
                const SizedBox(
                  height: xxxSmallerSpacing,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Search products...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSearchBarRadius),
                      borderSide: const BorderSide(),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.9),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: kHorizontalCategoryListItemWidth,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CategoryItemScreen.routeName,
                            arguments: false);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: kHorizontalCategoryListItemWidth,
                            width: kHorizontalCategoryListItemWidth,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(categoryData[index]['Image'])),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(height: xxxTinierSpacing),
                          SizedBox(
                            width: kHorizontalCategoryListItemWidth * 1.3,
                            child: Text(
                              categoryData[index]['name'],
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
