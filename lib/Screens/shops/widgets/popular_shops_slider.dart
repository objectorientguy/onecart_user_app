import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';

class PopularShopsSlider extends StatefulWidget {
  final List data;
  static const routeName = 'HorizontalCategoryList';

  const PopularShopsSlider({super.key, required this.data});

  @override
  State<PopularShopsSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<PopularShopsSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1,
      initialPage: 0,
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
          return ClipRRect(
            borderRadius: BorderRadius.circular(kZero),
            child: Image.asset(
              widget.data[pagePosition]['image'].toString(),
              fit: BoxFit.fill,
            ),
          );
        });
  }
}
