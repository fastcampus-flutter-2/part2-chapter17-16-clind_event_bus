import 'package:flutter/material.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindDivider extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const ClindDivider({
    super.key,
    required this.width,
    required this.height,
    this.color,
  });

  factory ClindDivider.vertical({
    double thickness = 1.0,
    Color? color,
  }) {
    return ClindDivider(
      width: thickness,
      height: double.infinity,
      color: color,
    );
  }

  factory ClindDivider.horizontal({
    double thickness = 1.0,
    Color? color,
  }) {
    return ClindDivider(
      width: double.infinity,
      height: thickness,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ColoredBox(
        color: color ?? context.dividerTheme.color,
      ),
    );
  }
}
