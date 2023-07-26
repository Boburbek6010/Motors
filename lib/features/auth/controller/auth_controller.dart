
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/features/home/presentation/pages/home_page.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/db_service.dart';
import '../../../core/services/util_service.dart';



final authController = ChangeNotifierProvider((ref) => AuthCT());

class AuthCT extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailControllerForLogin = TextEditingController();
  final TextEditingController passwordControllerForLogin = TextEditingController();
  final String nameExample = "name1234";
  final String passwordExample = "admin1234";
  bool isLoading = false;
  bool isPressed = false;
  bool passed = false;

  void registerNewUser(BuildContext context){
    isLoading = false;
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(name.isEmpty || email.isEmpty || password.isEmpty){
      Utils.fireSnackBar("Fill all gaps first", context);
      return;
    }

    AuthService.signUpUser(context, name, email, password).then((user) => _checkNewUser(user, context)).catchError(_catchError).then((value) {
      if(passed){
        Utils.fireSnackBar("Successfully registered", context);
        Navigator.pushReplacementNamed(context, AppRouteNames.SIGNIN);
        disposeAll();
        Utils.fireSnackBar("Now, you can Sign In ", context);
      }
    });
    notifyListeners();
  }

  void _checkNewUser(User? user, BuildContext context)async{
    log(user.toString());
    if(user != null){
      isLoading = false;
      passed = true;
      await DBService.saveUserId(user.uid);
      notifyListeners();
    }else{
      Utils.fireSnackBar("Check your data and try again", context);
      isLoading = true;
    }
    notifyListeners();
  }

  void _catchError(Object error){
    notifyListeners();
  }

  void disposeAll() {
    log("Disposed");
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    isLoading = false;
    isPressed = false;
    passed = false;
  }




  void login(BuildContext context){
    String email = emailControllerForLogin.text.trim();
    String password = passwordControllerForLogin.text.trim();
    if(email.isEmpty || password.isEmpty){
      Utils.fireSnackBar("Fill all gaps first", context);
      return;
    }
    AuthService.signInUser(context, email, password).then((user) => _checkUserForLogin(user, context)).catchError(_catchErrorForLogin);
    notifyListeners();
  }

  bool loginPassed = false;

  void _checkUserForLogin(User? user, BuildContext context)async{
    if(user != null){
      await DBService.saveUserId(user.uid);
      loginPassed = true;
      emailControllerForLogin.clear();
      passwordControllerForLogin.clear();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(
        userName: user.displayName!,
        userEmail: user.email!,
      )));
      Utils.fireSnackBar("Logged In", context);
    }else{
      Utils.fireSnackBar("Check your data and try again", context);
    }
    notifyListeners();
  }

  void _catchErrorForLogin(Object error){
    notifyListeners();
  }






}
