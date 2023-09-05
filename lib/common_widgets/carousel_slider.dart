import 'package:flutter/material.dart';
import 'package:onecart_user_app/data/models/home/home_model.dart';

import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class CarouselSlider extends StatefulWidget {
  static const routeName = 'HorizontalCategoryList';

  final List<PromotinalBanner> data;

  const CarouselSlider(
    this.data, {
    super.key,
  });

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9,initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.data.length,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (page) {},
        itemBuilder: (context, pagePosition) {
          return Container(
            margin: const EdgeInsets.only(right: tinySpacing, bottom:xxxTinierSpacing),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kGlobalBorderRadius),
              child: Image.network(
                widget.data[pagePosition].bannerImage!,
                fit: BoxFit.fill,
              ),
            ),
          );
        });
  }
}
