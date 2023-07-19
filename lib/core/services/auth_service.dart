import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gm_motors/core/services/util_service.dart';

class AuthService{
  static final _auth = FirebaseAuth.instance;

  static Future<User?> signUpUser(BuildContext context, String name, String email, String password)async{  //User nima?
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var user = credential.user;
      await user?.updateDisplayName(name);
      return user;
    }catch(e){
      Utils.fireSnackBar(e.toString().substring(30), context);
    }
    return null;
  }

  static Future<User?> signInUser(BuildContext context, String email, String password)async{  //User nima?
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      Utils.fireSnackBar(e.toString(), context);
    }
    return null;
  }

  static Future<void> signOutUser(BuildContext context)async{
    await _auth.signOut();
  }

}