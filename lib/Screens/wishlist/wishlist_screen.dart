import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/wishlist/widgets/gridview_widget.dart';
import 'package:onecart_user_app/Screens/wishlist/widgets/horizontal_wishlist_category.dart';
import 'package:onecart_user_app/Screens/wishlist/widgets/list_view_widget.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';

import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';

class WishlistScreen extends StatefulWidget {
  static const routeName = 'WishlistScreen';

  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isListView = true;

  void toggleView() {
    setState(() {
      isListView = !isListView;
    });
  }

  @override
  Widget build(BuildContext context) {
    List wishlistData = [
      {
        'title': 'All',
      },
      {
        'title': 'Fruits',
      },
      {
        'title': 'Staples',
      },
      {
        'title': 'Stationaries',
      },
      {
        'title': 'Beverages',
      },
      {
        'title': 'Home Care',
      },
      {
        'title': 'Dairy and Bakery',
      },
    ];
    return Scaffold(
      appBar: GenericAppBar(
        title: 'WishList',
        actions: [
          IconButton(
            color: AppColor.primary,
            onPressed: () {
              toggleView();
            },
            icon: Icon(isListView ? Icons.grid_view : Icons.list),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(children: [
          WishlistCategory(
            wishlistData: wishlistData,
          ),
          const SizedBox(
            height: xxxSmallestSpacing,
          ),
          Expanded(
            child: isListView ? const ListViewScreen() : const GridViewScreen(),
          ),
        ]),
      ),
    );
  }
}
