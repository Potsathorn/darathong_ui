import 'package:flutter/material.dart';
import 'utils.dart';

class GoldenCircularProgressIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color color;

  const GoldenCircularProgressIndicator({
    super.key,
    this.size = 30.0,
    this.strokeWidth = 3.0,
    this.color = PrimaryColors.primaryWarm,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
