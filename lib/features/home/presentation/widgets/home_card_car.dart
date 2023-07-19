import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gm_motors/core/style/colors.dart';

class HomeCardCar extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  const HomeCardCar({Key? key, required this.image, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.c33FFFFFF,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: MediaQuery.of(context).size.height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const Spacer(),
            Text(text,style: const TextStyle(
                color: AppColors.white,
                fontSize: 18
            ),),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
