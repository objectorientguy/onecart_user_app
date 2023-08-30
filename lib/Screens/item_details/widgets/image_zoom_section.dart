import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/image_carousel_slider.dart';

import '../../../configs/app_color.dart';

class ImageZoomSection extends StatefulWidget {
  static const routeName = 'ImageZoomSection';
  final List imageListOne;

  const ImageZoomSection({super.key, required this.imageListOne});

  @override
  State<ImageZoomSection> createState() => _ImageZoomSectionState();
}

class _ImageZoomSectionState extends State<ImageZoomSection> {
  late PageController _pageController;
  int currentIndex = ImageCarouselSlider.currentIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 400,
          width: 400,
          child: PageView.builder(
              itemCount: widget.imageListOne.length,
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
                        widget.imageListOne[index].toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageListOne.length, (index) {
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
