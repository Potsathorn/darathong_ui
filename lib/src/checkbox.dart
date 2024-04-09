import 'package:flutter/material.dart';
import 'utils.dart';

class GoldenCheckbox extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool? value;
  final void Function(bool?)? onChanged;

  const GoldenCheckbox({
    super.key,
    required this.value,
    this.padding,
    this.onChanged,
    this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: Checkbox(
                value: value,
                checkColor: PrimaryColors.dark,
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                      width: 1.0,
                      color: states.contains(MaterialState.selected)
                          ? PrimaryColors.primaryLight
                          : PrimaryColors.grey),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return PrimaryColors.primaryLight;
                  }
                  return PrimaryColors.grey;
                }),
                onChanged: onChanged),
          ),
          if (text != null) ...[
            const SizedBox(
              width: 10,
            ),
            Text(
              text!,
              style: textStyle,
            ),
          ]
        ],
      ),
    );
  }
}
