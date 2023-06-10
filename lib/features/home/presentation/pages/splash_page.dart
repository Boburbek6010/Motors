import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:gm_motors/core/routes/app_route_names.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';

import '../../../../core/style/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    assetsAudioPlayer.open(
      Audio("assets/audios/typing.mp3"),
    );
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.stop();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.c33FFFFFF,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: AnimatedTextKit(
            onFinished: () {
              assetsAudioPlayer.stop();
              Navigator.pushReplacementNamed(context, AppRouteNames.HOME);
            },
            animatedTexts: [
            TypewriterAnimatedText(
            'Assalomu Alaykum General Motors ilovasiga xush kelibsiz. '
            'Ilova O\'zbek mashinalari haqida rasmiy va yangilangan malumot ulashish maqsadida ishlab chiqildi. O\'ylaymizki mehnatimizni qadrlaysiz 😉',
            textStyle: const TextStyle(
                fontSize: 20,
                color: AppColors.white,
                fontWeight: FontWeight.w200
            ),
            speed: const Duration(milliseconds: 60),
          ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 2500),
            stopPauseOnTap: true,
          ),
        ),
      ),
    );
  }
}
