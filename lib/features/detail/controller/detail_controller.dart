import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/entity/car_class.dart';

final detailController = ChangeNotifierProvider.autoDispose((ref) => DetailCT());

class DetailCT extends ChangeNotifier {


}
