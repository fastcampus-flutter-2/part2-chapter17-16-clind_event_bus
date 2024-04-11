import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindChannelChip extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onTap;

  const ClindChannelChip({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.gray800,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.5),
                child: Image.network(
                  imageUrl,
                  width: 25.0,
                  height: 25.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 3.0,
              ),
              Text(
                name,
                style: context.textTheme.default12Regular.copyWith(
                  color: context.colorScheme.gray100,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClindLoadingChannelChip extends StatelessWidget {
  const ClindLoadingChannelChip({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      baseColor: context.colorScheme.gray800,
      highlightColor: context.colorScheme.gray900,
      child: Container(
        width: 88.0,
        height: 33.0,
        decoration: BoxDecoration(
          color: context.colorScheme.gray800,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
