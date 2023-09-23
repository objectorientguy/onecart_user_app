import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_dimensions.dart';

ThemeData appTheme = ThemeData(
  splashColor: AppColor.transparent,
  highlightColor: AppColor.transparent,
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
  TextStyle get xxxTiniest {
    return const TextStyle(
        fontSize: 8, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxTiniest {
    return const TextStyle(
        fontSize: 9, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xTiniest {
    return const TextStyle(
        fontSize: 10, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get tiniest {
    return const TextStyle(
        fontSize: 11, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxTinier {
    return const TextStyle(
        fontSize: 12, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get mTinier {
    return const TextStyle(
        fontSize: 12.5, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxTinier {
    return const TextStyle(
        fontSize: 13, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xTinier {
    return const TextStyle(
        fontSize: 14, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get tinier {
    return const TextStyle(
        fontSize: 15, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxTiny {
    return const TextStyle(
        fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxTiny {
    return const TextStyle(
        fontSize: 17, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xTiny {
    return const TextStyle(
        fontSize: 18, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get tiny {
    return const TextStyle(
        fontSize: 19, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxSmall {
    return const TextStyle(
        fontSize: 20, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxSmall {
    return const TextStyle(
        fontSize: 21, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xSmall {
    return const TextStyle(
        fontSize: 22, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get small {
    return const TextStyle(
        fontSize: 23, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxMedium {
    return const TextStyle(
        fontSize: 24, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxMedium {
    return const TextStyle(
        fontSize: 25, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xMedium {
    return const TextStyle(
        fontSize: 26, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get medium {
    return const TextStyle(
        fontSize: 27, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxLarge {
    return const TextStyle(
        fontSize: 28, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxLarge {
    return const TextStyle(
        fontSize: 29, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xLarge {
    return const TextStyle(
        fontSize: 30, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get large {
    return const TextStyle(
        fontSize: 31, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxTextSmall {
    return const TextStyle(
        fontSize: 32, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxTextSmall {
    return const TextStyle(
        fontSize: 33, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xTextSmall {
    return const TextStyle(
        fontSize: 34, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get textSmall {
    return const TextStyle(
        fontSize: 35, color: AppColor.black, fontWeight: FontWeight.w400);
  }

  TextStyle get xxxTextMedium {
    return const TextStyle(
        fontSize: 36, color: AppColor.black, fontWeight: FontWeight.w400);
  }
}
