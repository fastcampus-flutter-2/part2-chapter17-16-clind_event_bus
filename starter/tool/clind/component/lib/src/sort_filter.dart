import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindSortFilter extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ClindSortFilter({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClindIcon.expandMore(
            color: context.colorScheme.gray400,
          ),
          const SizedBox(
            width: 3.0,
          ),
          Flexible(
            child: Text(
              text,
              style: context.textTheme.default13Medium.copyWith(
                color: context.colorScheme.gray400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClindLoadingSortFilter extends StatelessWidget {
  const ClindLoadingSortFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      baseColor: context.colorScheme.gray800,
      highlightColor: context.colorScheme.gray900,
      child: Container(
        width: 60.0,
        height: 18.0,
        decoration: BoxDecoration(
          color: context.colorScheme.gray800,
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}