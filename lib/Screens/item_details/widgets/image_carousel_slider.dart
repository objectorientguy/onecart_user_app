import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

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
              onPageChanged: (page) {},
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Zoom(
                      child: Image.network(
                        widget.imageList[index].toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.imageList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemBuilder: (context, index) {
              if (index == 3) {
                return Stack(children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img_2.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
                        '+2',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ]);
              }
              return Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imageList[index].toString()),
                        fit: BoxFit.fitHeight)),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
