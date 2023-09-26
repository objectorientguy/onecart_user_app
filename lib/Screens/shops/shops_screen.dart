import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/root/root_screen.dart';
import 'package:onecart_user_app/Screens/shops/widgets/explore_shops_widget.dart';
import 'package:onecart_user_app/Screens/shops/widgets/popular_shops_slider.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';

class SelectShops extends StatelessWidget {
  const SelectShops({super.key});

  @override
  Widget build(BuildContext context) {
    List shopData = [
      {"image": "assets/Slide1.JPG"},
      {"image": "assets/Slide2.JPG"},
      {"image": "assets/Slide3.JPG"},
    ];

    List shopBrandData = [
      {"image": "assets/shop1.png"},
      {"image": "assets/shop2.png"},
      {"image": "assets/shop3.png"},
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/app_logo.png',
                        height: kLogoHeight,
                        width: kLogoWidth,
                      ),
                      const SizedBox(
                        width: xxTinierSpacing,
                      ),
                      Text(
                        'OneCart',
                        style: Theme.of(context).textTheme.xTiny.copyWith(
                            color: AppColor.mediumBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => const ProfileScreen()));
                  //   },
                  //   child: const CircleAvatar(
                  //     radius: kUserAvatar,
                  //     backgroundColor: AppColor.lighterGrey,
                  //     child: Icon(
                  //       Icons.person,
                  //       color: AppColor.primary,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              const SizedBox(
                height: smallestSpacing,
              ),
              PopularShopsSlider(
                data: shopData,
              ),
              const SizedBox(
                height: smallestSpacing,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "POPULAR SHOPS NEAR YOU",
                    style: Theme.of(context).textTheme.xTinier.copyWith(
                        color: AppColor.mediumBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: smallestSpacing,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RootScreen()));
                    },
                    child: SizedBox(
                      height: kShopBox,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: shopBrandData.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kGeneralBorderRadius),
                              child: Image.asset(
                                shopBrandData[index]['image'],
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: xxTinySpacing,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: xxxSmallestSpacing,
                  ),
                  Text(
                    "EXPLORE SHOPS",
                    style: Theme.of(context).textTheme.xTinier.copyWith(
                        color: AppColor.mediumBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: smallestSpacing,
                  ),
                  ExploreShops(
                    shopData: shopData,
                  ),
                  const SizedBox(
                    height: smallestSpacing,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
