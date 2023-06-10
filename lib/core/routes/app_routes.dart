import 'package:flutter/material.dart';
import 'package:gm_motors/features/detail/presentation/pages/detail_page.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/splash_page.dart';
import 'app_route_names.dart';


@immutable
class AppRoutes {
  const AppRoutes._();
  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRouteNames.HOME: (context) => const HomePage(),
    AppRouteNames.DETAIL: (context) => const DetailPage(),
    AppRouteNames.SPLASH: (context) => const SplashPage(),
  };
}
