import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/style/colors.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';
import 'package:gm_motors/features/crash/controller/crash_controller.dart';
import 'package:gm_motors/features/crash/presentation/widgets/crash_items.dart';

class CrashPage extends ConsumerStatefulWidget {
  const CrashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CrashPagaState();
}

class _CrashPagaState extends ConsumerState<CrashPage> {
  @override
  void initState() {
    super.initState();
    ref.read(crashVM).getNames();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(crashVM);
    return CustomScaffold(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.black,
            toolbarHeight: 40,
            title: const Text(
              "Crash Tests",
              style: TextStyle(color: AppColors.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: AppColors.transparent,
          body: Consumer(builder: (context, ref, widget) {
            log(ref.read(crashVM).isLoading.toString());
            return ref.read(crashVM).isLoading
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: ref.read(crashVM).allControllers.length,
                    itemBuilder: (context, index) {
                      return CrashItems(
                        controller: ref.read(crashVM).allControllers[index],
                        name: ref.read(crashVM).names[index],
                        progressIndicatorColor: AppColors.c292C31,
                        playedColor: AppColors.red,
                        handleColor: AppColors.white,
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          })),
    );
  }
}
