import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_dimensions.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.white,
  colorScheme: colorScheme,
  appBarTheme: appBarTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
);

ColorScheme colorScheme = const ColorScheme.light(
    primary: AppColor.primary,
    secondary: AppColor.primary,
    background: AppColor.white,
    surface: AppColor.white);

BottomNavigationBarThemeData bottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
  selectedItemColor: AppColor.primary,
  backgroundColor: AppColor.white,
  elevation: kZero,
  selectedLabelStyle: TextStyle(color: AppColor.primary, fontSize: 13),
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
  TextStyle get headingLarge {
    return const TextStyle(
        fontSize: 25, fontWeight: FontWeight.w700, color: AppColor.mediumBlack);
  }

  TextStyle get headingMedium {
    return const TextStyle(
        fontSize: 23, fontWeight: FontWeight.w700, color: AppColor.mediumBlack);
  }

  TextStyle get headingSmall {
    return const TextStyle(
        fontSize: 19, fontWeight: FontWeight.w700, color: AppColor.mediumBlack);
  }

  TextStyle get headingTiny {
    return const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w700, color: AppColor.mediumBlack);
  }

  TextStyle get subHeadingLarge {
    return const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get subHeadingMedium {
    return const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get subHeadingSmall {
    return const TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get textLarge {
    return const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w400, color: AppColor.mediumBlack);
  }

  TextStyle get textMedium {
    return const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w400, color: AppColor.mediumBlack);
  }

  TextStyle get textSmall {
    return const TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, color: AppColor.mediumBlack);
  }

  TextStyle get textButtonLarge {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.white);
  }

  TextStyle get textButtonSmall {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w700, color: AppColor.primary);
  }

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
