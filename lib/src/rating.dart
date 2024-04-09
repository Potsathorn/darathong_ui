import 'package:flutter/material.dart';
import 'utils.dart';

class GoldenStarRating extends StatefulWidget {
  final int rating;
  final Function(int) onRatingChanged;

  const GoldenStarRating(
      {super.key, required this.rating, required this.onRatingChanged});

  @override
  State<GoldenStarRating> createState() => _GoldenStarRatingState();
}

class _GoldenStarRatingState extends State<GoldenStarRating> {
  int _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentRating = index + 1;
              widget.onRatingChanged(_currentRating);
            });
          },
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return PrimaryColors.gradientConvex.createShader(bounds);
            },
            child: Icon(
              index < _currentRating ? Icons.star : Icons.star_border,
              color: PrimaryColors.white,
            ),
          ),
        );
      }),
    );
  }
}
