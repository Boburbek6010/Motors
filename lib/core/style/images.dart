import 'package:flutter/material.dart';


class AppImages {
  const AppImages._();

  ///  Svg



  ///  Png

  static final welcomeImage = Image.asset(
    'assets/images/image.png',
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
