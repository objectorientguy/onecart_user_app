import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_dimentions.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: appBarTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
);

BottomNavigationBarThemeData bottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
  backgroundColor: AppColor.white,
  elevation: kZero,
  selectedLabelStyle: TextStyle(color: AppColor.primary, fontSize: 16),
  selectedIconTheme: IconThemeData(
    color: AppColor.primary,
    size: kBottomNavBarIconSize,
  ),
);

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: AppColor.white,
  elevation: 0,
);

extension AppTextTheme on TextTheme {
  TextStyle get medium {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.black);
  }

  TextStyle get mediumLarge {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.black);
  }

  TextStyle get xLarge {
    return const TextStyle(fontSize: 22, color: AppColor.mediumBlack);
  }

  TextStyle get xxLarge {
    return const TextStyle(fontSize: 24, color: AppColor.mediumBlack);
  }

  TextStyle get large {
    return const TextStyle(fontSize: 20, color: AppColor.mediumBlack);
  }

  TextStyle get small {
    return const TextStyle(fontSize: 16, color: AppColor.grey);
  }

  TextStyle get xSmall {
    return const TextStyle(
        fontSize: 14, color: AppColor.mediumBlack, fontWeight: FontWeight.w400);
  }

  TextStyle get xxSmall {
    return const TextStyle(fontSize: 12, color: AppColor.mediumBlack);
  }

  TextStyle get xxxSmall {
    return const TextStyle(fontSize: 7, color: AppColor.white);
  }
}
