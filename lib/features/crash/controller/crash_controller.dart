import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final crashVM = ChangeNotifierProvider.autoDispose((ref) => CrashVM());

class CrashVM extends ChangeNotifier {
  bool isLoading = false;
  List<YoutubePlayerController> allControllers = [];
  List<String> videoID = [
    "VAPzkM3NR9E",
    "0ihveAPoErM",
    "FdfNrDdKAnw",
    "9v35HaSLdrk",
    "KotJsAg43Jw",
    "fFN5UCNtAi4",
    "WS5hDu21XXM",
    "EYaEhyxftkI",
    "gvC_n-R4am0",
    "F5KP4cu4AS8",
    "kk_8ia0TBDQ",
    "q6MR72Q6T6g",
  ];

  List<String> names = [
    "Chevrolet ${"Spark".toUpperCase()} crash test",
    "Chevrolet ${"Nexia".toUpperCase()} crash test",
    "Chevrolet ${"Lacetti".toUpperCase()} crash test",
    "Chevrolet ${"Cobalt".toUpperCase()} crash test",
    "Chevrolet ${"Malibu".toUpperCase()} crash test",
    "Chevrolet ${"Onix".toUpperCase()} crash test",
    "Chevrolet ${"Tracker".toUpperCase()} crash test",
    "Chevrolet ${"Equinox".toUpperCase()} crash test",
    "Chevrolet ${"Traverse".toUpperCase()} crash test",
    "Chevrolet ${"Tahoe".toUpperCase()} crash test",
    "TOP 10 SAFEST LUXURY CARS 2023",
    "THE SAFEST CARS IN THE WORLD 2023",
  ];

  void getNames() {
    for (int i = 0; i < videoID.length; i++) {
      var controller = YoutubePlayerController(
        initialVideoId: videoID[i],
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      allControllers.add(controller);
    }
    log("message");
    isLoading = true;
    // notifyListeners();
  }

  @override
  void dispose() {
    log("Crash is disposed");
    super.dispose();
    allControllers.map((e) => e.dispose());
  }

}