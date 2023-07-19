import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/services/util_service.dart';
import 'package:gm_motors/features/auth/controller/auth_controller.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widget/custom_scaffold.dart';
import '../widgets/register_main_card.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authController);
    return CustomScaffold(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Register yourself and \n           have fun",
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
                  RegisterMainCard(
                    emailController: ref.read(authController).emailController,
                    nameController: ref.read(authController).nameController,
                    passwordController: ref.read(authController).passwordController,
                    registerPressed: () {
                      ref.read(authController).isPressed = true;
                      ref.read(authController).registerNewUser(context);
                    },
                    signInPressed: () {
                      Navigator.pushReplacementNamed(context, AppRouteNames.SIGNIN);
                      ref.read(authController).nameController.clear();
                      ref.read(authController).emailController.clear();
                      ref.read(authController).passwordController.clear();
                    },
                  ),
                ],
              ),
            ),
            if(ref.read(authController).isPressed)
            !ref.read(authController).isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
