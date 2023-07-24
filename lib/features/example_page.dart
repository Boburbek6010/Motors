import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ModelViewer(
          backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: "assets/images/astronaut.glb",
          alt: 'A 3D model of an astronaut',
          ar: true,
          autoRotate: true,
          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: false,
        ),
      ),
    );
  }
}
