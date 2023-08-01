import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/utils/utils.dart';

import '../root/root_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.880,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                    _isLastPage = _currentIndex == Utils().modelList.length - 1;
                  });
                },
              ),
              items: Utils().modelList.map((itemUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.650,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            itemUrl.imagePath,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0350,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Text(
                            itemUrl.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headingSmall
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.mediumBlack,
                                ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.0850,
                bottom: MediaQuery.of(context).size.width * 0.0850,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: (!_isLastPage)
                    ? MediaQuery.of(context).size.height * 0.10
                    : MediaQuery.of(context).size.height * 0.25,
                child: ElevatedButton(
                  onPressed: () {
                    if (_isLastPage) {
                      Navigator.pushReplacementNamed(
                          context, RootScreen.routeName);
                    } else {
                      _carouselController.nextPage();
                    }
                  },
                  child: _isLastPage
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Let's get started",
                              style: Theme.of(context).textTheme.small.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.white),
                            ),
                            const Icon(Icons.navigate_next)
                          ],
                        )
                      : Text('Next',
                          style: Theme.of(context).textTheme.small.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColor.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
