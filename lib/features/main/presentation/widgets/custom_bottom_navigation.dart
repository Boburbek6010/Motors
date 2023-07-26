import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  final void Function(int)? onTap;
  final int index;
  const CustomBottomNavigation({super.key, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 55,
      buttonBackgroundColor: AppColors.c33FFFFFF,
      backgroundColor: AppColors.neuBlack,
      color: AppColors.c33FFFFFF,
      onTap: onTap,
      index: index,
      items: const [
        Icon(CupertinoIcons.home, color: AppColors.white),
        // Icon(CupertinoIcons.plus_square_on_square, color: AppColors.white),
        Icon(Icons.car_crash_outlined, color: AppColors.white),
      ],
    );
  }
}
