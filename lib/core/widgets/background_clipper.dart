import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width, 0);
    path0.lineTo(size.width * 0.9900000, size.height * 0.2450000);
    path0.lineTo(size.width * 0.9000000, size.height * 0.3450000);
    path0.lineTo(size.width * 0.9000000, size.height * 0.7450000);
    path0.lineTo(size.width, size.height * 0.9950000);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.1000000, size.height * 0.7500000);
    path0.lineTo(size.width * 0.0963000, size.height * 0.3329500);
    path0.lineTo(size.width * 0.1000000, size.height * 0.3350000);
    path0.lineTo(0, size.height * 0.2500000);
    path0.lineTo(0, 0);

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
