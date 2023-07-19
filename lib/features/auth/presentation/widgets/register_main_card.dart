import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';

class RegisterMainCard extends StatelessWidget {
  final VoidCallback signInPressed;
  final VoidCallback registerPressed;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const RegisterMainCard({super.key, required this.signInPressed, required this.registerPressed, required this.nameController, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: 550,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.c33FFFFFF,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: AppColors.c5effffff
              )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                /// Register
                const Center(
                  child: Text("Register", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                  ),),
                ),
                const Spacer(),
                /// Name
                const Text("Your name", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.c33FFFFFF,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.c33FFFFFF,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.c33FFFFFF,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.transparent,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Name",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n4DFFFFFF,
                    ),
                  ),
                ),
                const Spacer(),

                /// Email
                const Text("Your email", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.c33FFFFFF,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.c33FFFFFF,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.c33FFFFFF,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.transparent,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Email",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n4DFFFFFF,
                    ),
                  ),
                ),
                const Spacer(),

                /// Password
                const Text("Your Password", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.c33FFFFFF,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.c33FFFFFF,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.c33FFFFFF,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.transparent,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Create password",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n4DFFFFFF,
                    ),
                  ),
                ),
                const Spacer(),
                /// Button
                MaterialButton(
                  onPressed: registerPressed,
                  minWidth: double.infinity,
                  height: 45,
                  shape: const StadiumBorder(),
                  color: AppColors.n4DFFFFFF,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Register", style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward, color: AppColors.white,),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),),
                    const SizedBox(width: 7),
                    InkWell(
                      onTap: signInPressed,
                      child: const Text("Sign In", style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
