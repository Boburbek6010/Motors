import 'package:flutter/cupertino.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await getStorageValues();

}

// String? token;

// Future<void> getStorageValues() async {
//   token = await AppStorage.read(StorageKey.token);
//   l.w(token ?? '------\n------------\n-----------\n-------' ' ====================================');
// }
