import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage(this.width, this.color, {super.key});

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/quiz_logo.png',
      width: width,
      color: color,
    );
  }
}