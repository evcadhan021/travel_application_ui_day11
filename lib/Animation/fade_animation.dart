import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeMoveAnimation extends StatelessWidget {
  final Widget child; // Widget yang bakal dianimasiin
  final int delay; // Delay animasi

  const FadeMoveAnimation({super.key, required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    // Mengatur animasi fade dan move
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0), // Tween opasitas dari 0 ke 1
      duration: const Duration(seconds: 1), // Durasi animasi 2 detik
      delay: Duration(milliseconds: delay), // Delay animasi
      builder: (context, value, childWidget) {
        return Opacity(
          opacity: value, // Efek fade
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 50), // Gerakan dari bawah ke atas
            child: childWidget,
          ),
        );
      },
      child: child, // Widget yang dianimasiin
    );
  }
}
