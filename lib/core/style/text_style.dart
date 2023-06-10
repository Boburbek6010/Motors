

import 'package:flutter/material.dart';

import 'colors.dart';

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();



   /// eng yaqin songa qarab olinadi:

  @override
  TextStyle? get displayMedium => const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size48,
    color: AppColors.black,
  );

  @override
  TextStyle? get displaySmall => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSize.size40,
    color: AppColors.black,
  );

  @override
  TextStyle? get titleLarge => const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato',
    fontSize: FontSize.size28,
    color: AppColors.black,
  );


  @override
  TextStyle? get headlineSmall => const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size24,
    fontFamily: 'Lato',

    color: AppColors.black,
  );



  @override
  TextStyle? get titleMedium => const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size20,
    fontFamily: 'Lato',

    color: AppColors.black,
  );


  @override
  TextStyle? get labelLarge => const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: FontSize.size16,
    fontFamily: 'Lato',
    color: AppColors. black,
  );


  @override
  TextStyle? get titleSmall => const TextStyle(
    fontFamily: 'Poppins',

    fontWeight: FontWeight.w600,
    fontSize: FontSize.size14,
    color: AppColors.black,
  );


  @override
  TextStyle? get labelMedium => const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size13,
    color: AppColors.black,
  );

  //11
  @override
  TextStyle? get labelSmall => const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: FontSize.size11,
    color: AppColors.black,
  );

}


@immutable
class FontSize {
  const FontSize._();

  static const double size40 = 40;
  static const double size24 = 24;
  static const double size16 = 16;
  static const double size15 = 15;
  static const double size14 = 14;
  static const double size48 = 48;
  static const double size11 = 11;
  static const double size13 = 13;
  static const double size12 = 12;
  static const double size18 = 18;
  static const double size10 = 10;
  static const double size21 = 21;
  static const double size20 = 20;
  static const double size28 = 28;

}
