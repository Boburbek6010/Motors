import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback contentSendTapped;

  const CustomSliverAppBar(
      {super.key,
      required this.textEditingController,
      required this.contentSendTapped});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu, color: AppColors.white),
                ),
                const Flexible(
                  child: Text(
                    "Bu ilova hozirda test shaklida ishlamoqda! Taklif va shikoyatlarni quyida yozib qoldiring",
                    style: TextStyle(
                      color: AppColors.red,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: textEditingController,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
              cursorColor: AppColors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.c33FFFFFF,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.c33FFFFFF,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.c33FFFFFF,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.transparent,
                  ),
                ),
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.white,
                  ),
                  onPressed: contentSendTapped,
                ),
                prefixIconColor: AppColors.white,
                hintText: "Yozing...",
                labelText: "Shikoyat va Takliflar",
                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n4DFFFFFF,
                    ),
              ),
            ),
          ],
        ),
      ),
      pinned: true,
      toolbarHeight: 120,
      backgroundColor: AppColors.black,
    );
  }
}
