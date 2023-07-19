import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gm_motors/features/auth/presentation/pages/auth_gate.dart';
import 'package:gm_motors/features/auth/presentation/pages/sign_in_page.dart';
import 'package:gm_motors/features/auth/presentation/pages/sign_up_page.dart';
import 'package:gm_motors/features/detail/presentation/pages/detail_page.dart';

import '../../features/home/presentation/pages/home_page.dart';
import 'app_route_names.dart';


@immutable
class AppRoutes {
  const AppRoutes._();
  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRouteNames.HOME: (context) => const HomePage(),
    AppRouteNames.DETAIL: (context) => const DetailPage(),
    AppRouteNames.SIGNIN: (context) => const SignInPage(),
    AppRouteNames.SIGNUP: (context) => const SignUpPage(),
    AppRouteNames.AUTHGATE: (context) => const AuthGate(),
  };
}
