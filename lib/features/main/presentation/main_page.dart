import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gm_motors/features/crash/presentation/pages/crash_page.dart';
import 'package:gm_motors/features/entertainment/presentation/pages/crash_page.dart';
import 'package:gm_motors/features/main/presentation/widgets/custom_bottom_navigation.dart';

import '../../home/presentation/pages/home_page.dart';


class MainPage extends StatelessWidget {
  final String? userName;
  final String? userEmail;
  const MainPage({Key? key, this.userName, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomePage(userName: userName ?? "", userEmail: userEmail ?? ""),
            const CrashPage(),
            const EntertainmentPage(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          onTap: (int a ) {  },
          index: 1,
        ),
      ),
    );
  }
}
