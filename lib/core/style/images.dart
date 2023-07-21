import 'package:flutter/material.dart';


class AppImages {
  const AppImages._();

  ///  Svg


  ///  Png

  static final snowImage = Image.asset(
    'assets/images/back/snow.gif',
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.cover,
  );



  static final coloredImage = Image.asset(
    'assets/images/back/just1.jpeg',
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.cover,
  );






}

extension Extension on Image {
  Image copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) =>
      Image(
        image: image,
        width: width ?? this.width,
        height: height ?? this.height,
        fit: fit ?? this.fit,
        color: color ?? this.color,
      );
}
