import 'package:flutter/material.dart';
import 'package:gm_motors/core/services/remote_service.dart';
import 'package:gm_motors/core/style/images.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: (RemoteService.availableBackgrounds[RemoteService.backgroundImage]).image,
        ),
      ),
      child: child,
    ),
  );
}