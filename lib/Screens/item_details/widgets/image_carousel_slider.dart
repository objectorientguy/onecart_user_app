import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';

class ImageCarouselSlider extends StatefulWidget {
  final List imageList;

  const ImageCarouselSlider({
    super.key,
    required this.imageList,
  });

  @override
  State<ImageCarouselSlider> createState() => _ImageCarouselSliderState();
}

class _ImageCarouselSliderState extends State<ImageCarouselSlider> {
  late PageController _pageController;
  int currentIndex = 0;

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
                  currentIndex = page;
                });
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
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
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageList.length, (index) {
              if (index == currentIndex) {
                return const Icon(
                  Icons.circle,
                  color: AppColor.primary,
                  size: 12,
                );
              }
              return const Icon(
                Icons.circle,
                color: AppColor.grey,
                size: 10,
              );
            })),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
