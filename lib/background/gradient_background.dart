import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final Gradient gradient;

  const GradientBackground({
    super.key,
    required this.child,
    this.gradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4C1A4E),
        Color(0xFF1A021B),
      ],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }
}