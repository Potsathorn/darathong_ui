import 'package:flutter/material.dart';
import 'utils.dart';

class GoldenRadio extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final int value;
  final int? groupValue;
  final void Function(int?)? onChanged;
  final TextStyle? textStyle;

  const GoldenRadio({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10),
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return PrimaryColors.primaryLight;
              }
              return PrimaryColors.grey;
            }),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
            ),
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
