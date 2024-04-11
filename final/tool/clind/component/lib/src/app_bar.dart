import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindAppBar extends AppBar {
  ClindAppBar({
    super.key,
    required BuildContext context,
    super.leading,
    super.title,
    super.automaticallyImplyLeading = false,
    super.actions,
    super.leadingWidth = 41.0,
    super.elevation = 0,
    double? titleSpacing,
    double? toolbarHeight,
    Color? backgroundColor,
    bool? centerTitle,
    super.bottom,
  }) : super(
          scrolledUnderElevation: 0,
          titleSpacing: titleSpacing ?? context.appBarTheme.titleSpacing,
          backgroundColor: backgroundColor ?? context.appBarTheme.backgroundColor,
          centerTitle: centerTitle ?? context.appBarTheme.centerTitle,
          toolbarHeight: toolbarHeight ?? context.appBarTheme.toolbarHeight,
          systemOverlayStyle: context.appBarTheme.systemOverlayStyle,
        );
}

class ClindAppBarTitle extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  const ClindAppBarTitle({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  factory ClindAppBarTitle.simple(
    BuildContext context, {
    required String text,
  }) {
    return ClindAppBarTitle(
      title: Text(
        text,
        style: context.textTheme.default17Regular.copyWith(
          color: context.appBarTheme.primaryColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  factory ClindAppBarTitle.logo(BuildContext context) {
    return ClindAppBarTitle(
      title: Text(
        'Clind',
        style: context.textTheme.poppins18Bold.copyWith(
          color: context.colorScheme.gray600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) leading!,
        Flexible(
          child: title,
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class ClindAppBarBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ClindAppBarBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onTap != null) {
          onTap!.call();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: 41.0,
        padding: const EdgeInsets.only(
          right: 5.0,
        ),
        alignment: Alignment.centerRight,
        child: ClindIcon.arrowBack(
          color: context.colorScheme.gray300,
        ),
      ),
    );
  }
}

class ClindAppBarTextButton extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final Alignment alignment;
  final Color? color;
  final VoidCallback onTap;

  const ClindAppBarTextButton({
    super.key,
    required this.text,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap.call(),
      child: SizedBox(
        width: 56.0,
        child: Align(
          alignment: alignment,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              style: context.textTheme.default15Medium.copyWith(
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClindAppBarIconAction extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;

  const ClindAppBarIconAction({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap?.call(),
      child: SizedBox(
        width: 39.0,
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}