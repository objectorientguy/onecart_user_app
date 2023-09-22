import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class PopularShopsSlider extends StatefulWidget {
  static int currentIndex = 0;

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
    return Column(
      children: [
        SizedBox(
          height: kSizedBoxInfinite,
          child: PageView.builder(
              itemCount: widget.data.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  PopularShopsSlider.currentIndex = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(kGlobalBorderRadius),
                  child: Image.asset(
                    widget.data[pagePosition]['image'].toString(),
                    fit: BoxFit.fill,
                  ),
                );
              }),
        ),
        const SizedBox(
          height: xxxSmallestSpacing,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.data.length, (index) {
              if (index == PopularShopsSlider.currentIndex) {
                return const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: AppColor.paleBlack,
                      size: kDotSize,
                    ),
                    SizedBox(
                      width: xxTiniestSpacing,
                    )
                  ],
                );
              }
              return const Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColor.paleGrey,
                    size: kDotSize,
                  ),
                  SizedBox(
                    width: xxTiniestSpacing,
                  )
                ],
              );
            })),
      ],
    );
  }
}
