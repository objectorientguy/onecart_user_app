import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/image_carousel_slider.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';

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
    _pageController =
        PageController(viewportFraction: 1, initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(),
      body: Column(
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
                  return SizedBox(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageListOne[index]),
                              fit: BoxFit.fitHeight)),
                    ),
                  );
                }
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.imageListOne[index]),
                            fit: BoxFit.fitHeight)),
                  ),
                );
              })),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
