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
    title: 'GM Motors',
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
      primarySwatch: Colors.blueGrey,
    ),
    initialRoute: AppRouteNames.AUTHGATE,
    routes: AppRoutes.routes,
  );
}
