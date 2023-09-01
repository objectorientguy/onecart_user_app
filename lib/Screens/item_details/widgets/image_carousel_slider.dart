import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
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
          height: 40,
        ),
        SizedBox(
          height: 200,
          width: 200,
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
                    margin: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.imageList[index].toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageList.length, (index) {
              if (index == ImageCarouselSlider.currentIndex) {
                return const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: AppColor.black,
                      size: 7,
                    ),
                    SizedBox(
                      width: 2,
                    )
                  ],
                );
              }
              return const Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColor.grey,
                    size: 7,
                  ),
                  SizedBox(
                    width: 2,
                  )
                ],
              );
            })),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
