import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/address_bar.dart';
import 'package:onecart_user_app/Screens/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:onecart_user_app/Screens/home/widgets/horizontal_category_list.dart';
import 'package:onecart_user_app/Screens/home/widgets/todays_deals_section.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import '../../commonWidgets/carousel_slider.dart';
import '../../configs/app_dimentions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: leftRightMargin, vertical: topBottomPadding),
                child: Column(
                  children: [
                    const AddressBar(),
                    const SizedBox(
                      height: xxxSmallerSpacing,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Search products...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kSearchBarRadius),
                          borderSide: const BorderSide(),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              const HorizontalCategoryList(),
              const SizedBox(
                height: tiniestSpacing,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.width * 0.55,
                  child: const CarouselSlider()),
              const TodayDealsSection()
            ],
          ),
        ),
      ),
    );
  }
}
