import 'package:flutter/material.dart';
import 'package:tool_clind_theme/gen/gen.dart';
import 'package:tool_clind_theme/theme.dart';

class CommunityAllChannelButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const CommunityAllChannelButton({
    super.key,
    this.text = '전체',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: 63.0,
        child: ColoredBox(
          color: context.colorScheme.darkBlack,
          child: Center(
            child: Text(
              text,
              style: context.textTheme.default14Medium.copyWith(
                color: ColorName.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityLoadingAllChannelButton extends StatelessWidget {
  const CommunityLoadingAllChannelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommunityAllChannelButton(
      text: '',
    );
  }
}
