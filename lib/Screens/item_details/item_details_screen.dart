import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/item_details_section.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/item_photos_section.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/selling_partner_deatils.dart';
import 'package:onecart_user_app/common_widgets/custom_elevated_button.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../cart/cart_screen.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = 'ItemDetailsScreen';
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: AppColor.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.black,
              )),
        ],
        titleSpacing: xxxTiniestSpacing,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ItemPhotosSection(),
            const ItemDetailsSection(),
            const DeliverDetailsSection(),
            const SizedBox(
              height: tinySpacing,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
              child: Column(
                children: [
                  const SizedBox(height: xxxTinySpacing),
                  CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CartScreen.routeName,
                            arguments: false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('₹8900 ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .textButtonLarger),
                              Text('| 23 ITEMS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .textButtonLarge)
                            ],
                          ),
                          const Row(
                            children: [
                              Text('SEE CART'),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                            ],
                          )
                        ],
                      )),
                  const SizedBox(height: xxxTinySpacing),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
