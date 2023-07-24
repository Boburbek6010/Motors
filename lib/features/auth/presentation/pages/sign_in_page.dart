import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/routes/app_route_names.dart';
import 'package:gm_motors/core/style/colors.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';
import 'package:gm_motors/features/auth/controller/auth_controller.dart';

import '../widgets/sign_main_card.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authController);
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Whatever happens\n  here, stays here",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please fill the form on the below.",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 40),
              SignMainCard(
                loginPressed: () {
                  if(ref.read(authController).emailControllerForLogin.text.trim().toString() == ref.read(authController).nameExample && ref.read(authController).passwordControllerForLogin.text.trim().toString() == ref.read(authController).passwordExample){
                    Navigator.pushReplacementNamed(context, AppRouteNames.MAIN);
                  }else{
                    ref.read(authController).login(context);
                    log("email: ${ref.read(authController).emailControllerForLogin.text}  \npassword: ${ref.read(authController).passwordControllerForLogin.text}");
                  }
                },
                signUpPressed: () {
                  Navigator.pushReplacementNamed(context, AppRouteNames.SIGNUP);
                  ref.read(authController).emailControllerForLogin.clear();
                  ref.read(authController).passwordControllerForLogin.clear();
                },
                emailController: ref.read(authController).emailControllerForLogin,
                passwordController: ref.read(authController).passwordControllerForLogin,
                forgotPasswordPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
