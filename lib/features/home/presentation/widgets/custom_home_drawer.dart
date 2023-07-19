import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gm_motors/core/style/colors.dart';

class CustomHomeDrawer extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback deleteAccountPressed;
  final VoidCallback logOutPressed;
  // final VoidCallback deleteAccountPressed;

  const CustomHomeDrawer({super.key, required this.name, required this.email, required this.deleteAccountPressed, required this.logOutPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/back/just1.jpeg'),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  child: Icon(Icons.person, size: 45),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 24,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              print("object10");
              log("message10");
            },
            child: ListTile(
              leading: const Icon(Icons.logout, color: AppColors.white),
              title: const Text('Log out', style: TextStyle(
                color: AppColors.white,
              ),),
              onTap: () {
                // Handle item 1 tap
              },
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              print("object");
              log("message5");
            },
            child: ListTile(
              leading: const Icon(CupertinoIcons.square_arrow_left, color: AppColors.white),
              title: const Text('Log out', style: TextStyle(
                color: AppColors.white,
              ),),
              onTap: () {
                // Handle item 1 tap
              },
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: deleteAccountPressed,
            child: ListTile(
              leading: const Icon(CupertinoIcons.delete_simple, color: AppColors.red),
              title: const Text('Delete account', style: TextStyle(
                color: AppColors.red,
              ),),
              onTap: () {
                // Handle item 1 tap
              },
            ),
          ),
        ],
      ),
    );
  }
}
