import 'package:flutter/material.dart';
import 'package:onecart_user_app/data/models/home/home_model.dart';

class CarouselSlider extends StatefulWidget {
  static const routeName = 'HorizontalCategoryList';
  final List<PromotinalBanner> data;

  const CarouselSlider(this.data, {super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  late PageController _pageController;
  // List<String> images = [
  //   "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
  //   "https://wallpaperaccess.com/full/2637581.jpg",
  //   "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  // ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
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
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.data[pagePosition].bannerImage!,
                fit: BoxFit.fill,
              ),
            ),
          );
        });
  }
}
