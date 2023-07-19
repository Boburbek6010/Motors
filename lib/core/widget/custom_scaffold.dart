import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    // resizeToAvoidBottomInset: false,
    body: Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/back/just1.jpeg'),
        ),
      ),
      child: child,
    ),
  );
}