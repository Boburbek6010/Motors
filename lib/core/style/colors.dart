import 'dart:ui';
import 'package:flutter/foundation.dart';

@immutable
class AppColors {
  const AppColors._();

  //main colors
  static const transparent = Color(0x00000000);
  static const white = Color(0xffffffff);
  static const black = Color(0xFF000000);
  static const red = Color(0xFFFF0000);
  static const green = Color(0xFF03c04a);

  //every colors
  static const c292C31 = Color(0xff292C31);
  static const c5effffff = Color(0x5effffff);
  static const c5D6167 = Color(0xff5D6167);
  static const ndFFFFFF = Color(0xdffffff);
  static const n4DFFFFFF = Color(0x4DFFFFFF);
  static const n12ffffff = Color(0x12ffffff);
  static const c000000 = Color(0xff000000);
  static const c252323 = Color(0xff252323);
  static const c33FFFFFF = Color(0x1affffff);
  static const c292929 = Color(0xff292929);
  static const neuBlack = Color(0xFF3E3E3E);

  // gradients
  static const unlockPageGradient = <Color>[c252323, c000000,c000000,c000000,  c252323];

}