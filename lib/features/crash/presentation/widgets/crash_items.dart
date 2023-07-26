import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:gm_motors/core/style/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CrashItems extends StatelessWidget {
  final YoutubePlayerController controller;
  final Color progressIndicatorColor;
  final Color playedColor;
  final Color handleColor;
  final String name;
  const CrashItems({super.key, required this.controller, required this.progressIndicatorColor, required this.playedColor, required this.handleColor, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: progressIndicatorColor,
            progressColors: ProgressBarColors(
              playedColor: playedColor,
              handleColor: handleColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(
            color: AppColors.black
          ),),
        ],
      ),
    );
  }
}
