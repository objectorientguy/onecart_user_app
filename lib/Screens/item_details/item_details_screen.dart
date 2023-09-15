import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/image_carousel_slider.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/item_details_section.dart';

import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:share_plus/share_plus.dart';

import '../../configs/app_color.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/home/home_model.dart';
import 'package:badges/badges.dart' as badges;

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = 'ItemDetailsScreen';
  final Product itemDetails;

  const ItemDetailsScreen({Key? key, required this.itemDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        actions: [
          FavoriteButton(
            valueChanged: () {},
            iconSize: kFavouriteButton,
          ),
          const SizedBox(
            width: xxxTinierSpacing,
          ),
          Padding(
              padding: const EdgeInsets.only(right: leftRightMargin),
              child: IconButton(
                onPressed: () {
                  Share.share('https://onecart-8ac19.web.app');
                },
                icon: const Icon(
                  Icons.share,
                  color: AppColor.primary,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(
                  right: leftRightMargin, top: topBottomPadding),
              child: badges.Badge(
                badgeContent: Text('2'),
                child: Icon(
                  Icons.shopping_cart_sharp,
                  color: AppColor.primary,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ImageCarouselSlider(
              imageList: [],
            ),
            ItemDetailsSection(itemData: itemDetails),
          ],
        ),
      ),
    );
  }
}
