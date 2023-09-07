import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_dimensions.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.white,
  colorScheme: colorScheme,
  appBarTheme: appBarTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  fontFamily: 'Poppins',
);

ColorScheme colorScheme = const ColorScheme.light(
    primary: AppColor.primary,
    secondary: AppColor.primaryLight,
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
  TextStyle get headingLargest {
    return const TextStyle(
        fontSize: 36, fontWeight: FontWeight.bold, color: AppColor.black);
  }

  TextStyle get headingLarger {
    return const TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.black);
  }

  TextStyle get headingLarge {
    return const TextStyle(
        fontSize: 25, fontWeight: FontWeight.w700, color: AppColor.black);
  }

  TextStyle get headingMedium {
    return const TextStyle(
        fontSize: 23, fontWeight: FontWeight.w700, color: AppColor.black);
  }

  TextStyle get headingSmall {
    return const TextStyle(
        fontSize: 19, fontWeight: FontWeight.w700, color: AppColor.black);
  }

  TextStyle get headingSmallx {
    return const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.black);
  }

  TextStyle get headingTiny {
    return const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, color: AppColor.black);
  }

  TextStyle get headingxTiny {
    return const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.black);
  }

  TextStyle get subHeadingLarge {
    return const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get subHeadingxLarge {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get xxTinier {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get subHeadingLargex {
    return const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w300, color: AppColor.grey);
  }

  TextStyle get subHeadingLarger {
    return const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get subHeadingMedium {
    return const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get subHeadingxMedium {
    return const TextStyle(
        fontSize: 11, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get subHeadingSmall {
    return const TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get xsubHeadingSmall {
    return const TextStyle(
        fontSize: 8, fontWeight: FontWeight.w400, color: AppColor.grey);
  }

  TextStyle get textLarger {
    return const TextStyle(
        fontSize: 19, fontWeight: FontWeight.w700, color: AppColor.mediumBlack);
  }

  TextStyle get textLarge {
    return const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w400, color: AppColor.mediumBlack);
  }

  TextStyle get textMedium {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.mediumBlack);
  }

  TextStyle get xtextMedium {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.mediumBlack);
  }

  TextStyle get textMediumx {
    return const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w300, color: AppColor.grey);
  }

  TextStyle get xxxTinier {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.mediumBlack);
  }

  TextStyle get textSmall {
    return const TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, color: AppColor.mediumBlack);
  }

  TextStyle get textxSmall {
    return const TextStyle(
        fontSize: 9, fontWeight: FontWeight.w600, color: AppColor.primary);
  }

  TextStyle get textButtonLarge {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.white);
  }

  TextStyle get textButtonLarger {
    return const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w600, color: AppColor.white);
  }

  TextStyle get textButtonSmall {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w700, color: AppColor.primary);
  }

  TextStyle get textButtonxSmall {
    return const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.primary);
  }

  TextStyle get textButtonxxSmall {
    return const TextStyle(
        fontSize: 11, fontWeight: FontWeight.w400, color: AppColor.primary);
  }

  TextStyle get medium {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.black);
  }

  TextStyle get xmedium {
    return const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.black);
  }

  TextStyle get mediumLarge {
    return const TextStyle(
        fontSize: 19, fontWeight: FontWeight.w500, color: AppColor.black);
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

  TextStyle get xxGSmall {
    return const TextStyle(fontSize: 12, color: AppColor.grey);
  }

  TextStyle get xxxSmall {
    return const TextStyle(fontSize: 8, color: AppColor.white);
  }

  TextStyle get smallRed {
    return const TextStyle(fontSize: 15, color: AppColor.red);
  }

  TextStyle get smallGrey {
    return const TextStyle(fontSize: 17, color: AppColor.darkerGrey);
  }
}
