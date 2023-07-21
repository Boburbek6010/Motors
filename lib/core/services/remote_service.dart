import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:gm_motors/core/style/images.dart';

class RemoteService {
  static final remoteConfig = FirebaseRemoteConfig.instance;

  static final Map<String, dynamic> availableBackgroundColors = {
    "red": Colors.red,
    "yellow": Colors.yellow,
    "blue": Colors.blue,
    "green": Colors.green,
    "white": Colors.white,
    "tr": Colors.transparent
  };


  static final Map<String, dynamic> availableBackgrounds = {
    "snow": AppImages.snowImage,
    "colored": AppImages.coloredImage
  };


  static String backgroundColor = "tr";

  static String backgroundImage = "colored";


  static Future<void> initConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 20),
      minimumFetchInterval: Duration.zero,
    ));
    await remoteConfig.setDefaults(const {
      "background_color": "blue",
      "background_image": "colored"
    });
    await fetchConfig();
  }

  static Future<void> fetchConfig() async {
    await remoteConfig.fetchAndActivate().then((value) => {
      backgroundColor = remoteConfig.getString('background_color').isNotEmpty
          ? remoteConfig.getString('background_color')
          : "red",
      log("Remote config is worked: $value"),

      backgroundImage = remoteConfig.getString('background_image').isNotEmpty
          ? remoteConfig.getString('background_image')
          : "colored",
      debugPrint("Remote config is worked: $value")

    },
    );
  }
}