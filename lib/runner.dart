import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gm_motors/setup.dart';
import 'package:l/l.dart';

import 'features/app.dart';

void run() => l.capture<void>(
      () => runZonedGuarded<void>(
        () async {
          await setup();
          // await EasyLocalization.ensureInitialized();
          await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp],
          ).then(
            (_) => App.run(),
          );
        },
        (final error, final stackTrace) {
          l.e(
            'io_top_level_error: ${error.toString()}\n $stackTrace',
            stackTrace,
          );
        },
      ),
      const LogOptions(
        printColors: true,
        handlePrint: true,
        outputInRelease: true,
      ),
    );
