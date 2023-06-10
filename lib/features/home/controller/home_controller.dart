import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeController = ChangeNotifierProvider.autoDispose((ref) => HomeCT());

class HomeCT extends ChangeNotifier {

  List<String> carName = [
    "Cobalt",
    "Damas",
    "Equinox",
    "Lacetti",
    "Malibu",
    "Spark",
    "Nexia",
    "Nexia3",
    "Tahoe",
  ];
  List<String> carImage = [
    "assets/images/cobalt.png",
    "assets/images/damas.png",
    "assets/images/equinox.png",
    "assets/images/lacetti.png",
    "assets/images/malibu.png",
    "assets/images/spark.png",
    "assets/images/nexia.png",
    "assets/images/nexia3.png",
    "assets/images/tahoe.png",
  ];

}
