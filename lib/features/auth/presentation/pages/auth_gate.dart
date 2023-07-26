import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gm_motors/features/auth/presentation/pages/sign_in_page.dart';
import 'package:gm_motors/features/home/presentation/pages/home_page.dart';
import 'package:gm_motors/features/main/presentation/pages/main_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return MainPage(userName: snapshot.data!.displayName ?? "No name", userEmail: snapshot.data!.email ?? "No email",);
        }else{
          return const SignInPage();
        }
      },
    );
  }
}