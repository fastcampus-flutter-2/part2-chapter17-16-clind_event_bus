import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class SearchEmptyView extends StatelessWidget {
  final String text;

  const SearchEmptyView({
    super.key,
    this.text = '최근 검색한 내용이 없습니다.',
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.bg2,
      child: SizedBox(
        height: 128.0,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: context.textTheme.default17Medium.copyWith(
                    color: context.colorScheme.gray600,
                  ),
                ),
              ),
            ),
            ClindDivider.horizontal(),
          ],
        ),
      ),
    );
  }
}
