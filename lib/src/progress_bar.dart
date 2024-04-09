import 'package:flutter/material.dart';
import 'utils.dart';

class GoldenProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double progress;

  const GoldenProgressBar({
    super.key,
    required this.width,
    required this.height,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 2),
        color: PrimaryColors.grey,
      ),
      child: Stack(
        children: [
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: PrimaryColors.primaryWarm),
              borderRadius: BorderRadius.circular(height / 2),
              boxShadow: [
                const BoxShadow(
                  color: PrimaryColors.white,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: PrimaryColors.black.withOpacity(0.3),
                  offset: const Offset(0.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                ),
              ],
              gradient: PrimaryColors.gradientConvex,
            ),
          ),
        ],
      ),
    );
  }
}
