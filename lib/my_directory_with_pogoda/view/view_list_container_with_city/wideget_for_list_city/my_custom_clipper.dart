import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30;

    Path path = Path()
      ..moveTo(radius, 16)
      ..lineTo(size.width - radius, size.height / 2 - radius)
      ..arcToPoint(Offset(size.width, size.height / 2),
          radius: Radius.circular(radius))
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height),
          radius: Radius.circular(radius))
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius),
          radius: Radius.circular(radius))
      ..lineTo(0, radius + 16)
      ..arcToPoint(Offset(radius, 16), radius: Radius.circular(radius))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}