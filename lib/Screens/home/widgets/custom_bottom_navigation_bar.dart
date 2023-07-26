import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavBarHeight,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kBottomNavBarRadius),
              topRight: Radius.circular(kBottomNavBarRadius)),
          boxShadow: [
            BoxShadow(
              color: AppColor.grey,
              spreadRadius: 1,
              blurRadius: kBottomNavBarRadius,
            ),
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kBottomNavBarRadius),
            topRight: Radius.circular(kBottomNavBarRadius)),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
          ],
        ),
      ),
    );
  }
}
