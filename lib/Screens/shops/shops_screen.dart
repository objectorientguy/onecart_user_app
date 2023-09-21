import 'package:flutter/material.dart';
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
      {"image": "assets/haldirams.png"},
      {"image": "assets/burger.png"},
      {"image": "assets/beans.jpeg"},
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
              Text(
                "POPULAR SHOPS NEAR YOU",
                style: Theme.of(context).textTheme.xTinier.copyWith(
                    color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: smallestSpacing,
              ),
              SizedBox(
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
                          width: kGeneralBox,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: tiniestSpacing,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: xxxSmallestSpacing,
              ),
              Text(
                "EXPLORE SHOPS",
                style: Theme.of(context).textTheme.xTinier.copyWith(
                    color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: smallestSpacing,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: shopData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: kShopExplore,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(shopData[index]['image']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              BorderRadius.circular(kGeneralBorderRadius),
                          color: Colors.redAccent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: leftRightMargin,
                            vertical: topBottomPadding),
                        child: Text(
                          ' Get\n 50% OFF\n on your favourite items',
                          style: Theme.of(context).textTheme.xSmall.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: xxSmallestSpacing);
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
