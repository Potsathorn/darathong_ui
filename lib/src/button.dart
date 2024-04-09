import 'package:flutter/material.dart';
import 'utils.dart';

enum GoldenButtonStyle { primary, secondary, convex, flat }

class GoldenButton extends StatefulWidget {
  /// The [text] parameter must not be null.
  final String text;

  /// Callback to execute when the button is pressed.
  final VoidCallback onPressed;

  /// Defines the style of the button.
  final GoldenButtonStyle style;

  /// The radius of the button.
  final double? radius;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The text color of the button.
  final Color? textColor;

  /// Creates a golden button.
  /// The [text] parameter must not be null.
  /// The [onPressed] parameter must not be null.
  const GoldenButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = GoldenButtonStyle.primary,
    this.radius,
    this.width,
    this.height,
    this.textColor,
  });

  @override
  State<GoldenButton> createState() => _GoldenButtonState();
}

class _GoldenButtonState extends State<GoldenButton> {
  bool _isPressed = false;

  Gradient _getStyle() {
    switch (widget.style) {
      case GoldenButtonStyle.primary:
        return PrimaryColors.gradientPrimary;
      case GoldenButtonStyle.secondary:
        return PrimaryColors.gradientSecondary;
      case GoldenButtonStyle.convex:
        return PrimaryColors.gradientConvex;
      case GoldenButtonStyle.flat:
        return PrimaryColors.gradientFlat;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      child: Transform.translate(
        offset: _isPressed ? const Offset(0.0, 2.0) : Offset.zero,
        child: Container(
          width: widget.width ?? 130,
          height: widget.height ?? 40,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: PrimaryColors.primaryWarm),
            borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 5)),
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
            gradient: _getStyle(),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                color: widget.textColor ?? PrimaryColors.dark,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    offset: const Offset(0.0, -1.0),
                    blurRadius: 0.0,
                    color: PrimaryColors.black.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
