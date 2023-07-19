import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await getStorageValues();

}



// String? token;

// Future<void> getStorageValues() async {
//   token = await AppStorage.read(StorageKey.token);
//   l.w(token ?? '------\n------------\n-----------\n-------' ' ====================================');
// }
