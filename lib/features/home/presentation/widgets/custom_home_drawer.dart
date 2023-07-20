import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gm_motors/core/style/colors.dart';

import 'every_drawer_item.dart';

class CustomHomeDrawer extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback deleteAccountPressed;
  final VoidCallback logOutPressed;
  final VoidCallback profilePressed;

  const CustomHomeDrawer({super.key, required this.name, required this.email, required this.deleteAccountPressed, required this.logOutPressed, required this.profilePressed});

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
          EveryDrawerItem(
            name: "Profile",
            icon: Icons.person,
            onPressed: profilePressed,
          ),
          EveryDrawerItem(
            name: "Log out",
            icon: CupertinoIcons.square_arrow_left,
            onPressed: logOutPressed,
          ),
          EveryDrawerItem(
            color: AppColors.red,
            name: "Delete account",
            icon: CupertinoIcons.delete,
            onPressed: deleteAccountPressed,
          ),
        ],
      ),
    );
  }
}
