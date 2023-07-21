import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/util_service.dart';
import '../../../../core/style/colors.dart';

class ShowModalSheetItem extends StatelessWidget {
  final bool hasError;
  final String errorText;
  final TextEditingController? deleteAccountController;
  final String name;
  final String contact;
  final void Function(String)? onChanged;
  final VoidCallback onPressed;
  const ShowModalSheetItem({Key? key, required this.hasError, required this.errorText, required this.deleteAccountController, required this.name, required this.contact, this.onChanged, required this.onPressed}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tell the reason why you are deleting your account?"),
          TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              errorText: hasError ? errorText : null,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
              ),
            ),
            controller: deleteAccountController,
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            shape: const StadiumBorder(),
            color: AppColors.white,
            onPressed: onPressed,
            child: const Text('Report')
          )
        ],
      ),
    );
  }
}
