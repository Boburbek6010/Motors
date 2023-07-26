import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/features/crash/presentation/pages/crash_page.dart';
import 'package:gm_motors/features/entertainment/presentation/pages/crash_page.dart';
import 'package:gm_motors/features/main/controller/main_controller.dart';
import 'package:gm_motors/features/main/presentation/widgets/custom_bottom_navigation.dart';

import '../../../home/presentation/pages/home_page.dart';


class MainPage extends ConsumerWidget {
  final String? userName;
  final String? userEmail;
  const MainPage({Key? key, this.userName, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainVM);
    return WillPopScope(
      onWillPop: ()async{
        if (Platform.isAndroid) {
          SystemNavigator.pop();
          return true;
        } else if (Platform.isIOS) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          controller: ref.read(mainVM).pageController,
          onPageChanged: ref.read(mainVM).changePageIndex,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomePage(userName: userName ?? "", userEmail: userEmail ?? ""),
            // const CrashPage(),
            // const EntertainmentPage(),
          ],
        ),
        // bottomNavigationBar: CustomBottomNavigation(
        //   onTap: ref.read(mainVM).changePageIndex,
        //   index: ref.read(mainVM).pageIndex,
        // ),
      ),
    );
  }
}
