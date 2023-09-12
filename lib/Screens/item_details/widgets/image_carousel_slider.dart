import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'image_zoom_section.dart';

class ImageCarouselSlider extends StatefulWidget {
  final List imageList;
  static int currentIndex = 0;

  const ImageCarouselSlider({
    super.key,
    required this.imageList,
  });

  @override
  State<ImageCarouselSlider> createState() => _ImageCarouselSliderState();
}

class _ImageCarouselSliderState extends State<ImageCarouselSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: xMediumSpacing,
        ),
        SizedBox(
          height: kSizedBoxInfinite,
          child: PageView.builder(
              itemCount: widget.imageList.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  ImageCarouselSlider.currentIndex = page;
                });
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ImageZoomSection.routeName,
                        arguments: widget.imageList);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.all(xxxTinierSpacing),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderDiscount),
                      child: Image.network(
                        widget.imageList[index].toString(),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: xxxSmallestSpacing,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageList.length, (index) {
              if (index == ImageCarouselSlider.currentIndex) {
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
        const SizedBox(
          height: xxxSmallestSpacing,
        ),
      ],
    );
  }
}
