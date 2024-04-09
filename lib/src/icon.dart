import 'package:flutter/material.dart';
import 'utils.dart';

class GoldenIcon extends StatelessWidget {
  /// The icon data to display.
  final IconData iconData;

  /// The size of the icon.
  final double? size;

  const GoldenIcon(this.iconData, {super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return PrimaryColors.gradientConvex.createShader(bounds);
      },
      child: Icon(
        iconData,
        size: size,
        color: PrimaryColors.white,
      ),
    );
  }
}
