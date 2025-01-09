import 'package:flutter/material.dart';
class BackgroundImageHouse extends StatelessWidget {
  const BackgroundImageHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 392.7,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/image/House.png',
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}
