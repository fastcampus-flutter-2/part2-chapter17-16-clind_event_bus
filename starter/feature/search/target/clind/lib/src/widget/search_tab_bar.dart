import 'package:flutter/material.dart';
import 'package:tool_clind_theme/theme.dart';

class SearchTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;
  final Function(int) onTap;
  final EdgeInsets padding;

  const SearchTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      padding: padding,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorColor: context.colorScheme.gray100,
      labelStyle: context.textTheme.default15Medium,
      labelColor: context.colorScheme.gray100,
      unselectedLabelStyle: context.textTheme.default15Medium,
      unselectedLabelColor: context.colorScheme.gray400,
      dividerColor: context.appBarTheme.backgroundColor,
      tabs: List.generate(
        tabs.length,
        (index) => Tab(text: tabs[index]),
      ),
      onTap: (index) => onTap.call(index),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (_) => Colors.transparent,
      ),
    );
  }
}
