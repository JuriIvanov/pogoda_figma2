


import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 813.1,
      width: 392.7,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/image/фон.png',
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}
