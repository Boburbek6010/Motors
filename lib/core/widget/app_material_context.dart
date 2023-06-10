import 'package:flutter/material.dart';

import '../routes/app_route_names.dart';
import '../routes/app_routes.dart';
import '../style/colors.dart';

class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({Key? key}) : super(key: key);

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Assistant',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        primarySwatch: Colors.blueGrey,
      ),
      // initialRoute: token != null && token!.isNotEmpty ? AppRouteNames.MAIN : AppRouteNames.SPLASH,
      initialRoute: AppRouteNames.SPLASH,
      routes: AppRoutes.routes,
    );
}

