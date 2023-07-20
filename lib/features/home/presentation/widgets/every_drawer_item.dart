import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';

class EveryDrawerItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  const EveryDrawerItem({Key? key, this.color, required this.name, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      height: 50,
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.n26FFFFFF.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        minWidth: double.infinity,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            Icon(icon, color: color ?? AppColors.white),
            const SizedBox(width: 16),
            Text(
              name,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: color ?? AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
