import 'package:flutter/material.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindDialog extends StatelessWidget {
  final Widget title;
  final double? buttonSpacing;
  final List<Widget> buttons;
  final bool barrierDismissible;

  const ClindDialog({
    super.key,
    required this.title,
    this.buttonSpacing,
    required this.buttons,
    this.barrierDismissible = true,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    String confirmLabel = '확인',
    VoidCallback? onConfirm,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) {
    return showRich(
      context,
      title: ClindDialogTitle(title),
      buttons: [
        ClindDialogButton.confirm(
          context,
          text: confirmLabel,
          onTap: () {
            Navigator.of(context).pop();

            onConfirm?.call();
          },
        ),
      ],
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showConfirm(
    BuildContext context, {
    required String title,
    String confirmLabel = '확인',
    String cancelLabel = '취소',
    VoidCallback? onCancel,
    required VoidCallback onConfirm,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) {
    return showRich(
      context,
      title: ClindDialogTitle(title),
      buttons: [
        ClindDialogButton.cancel(
          context,
          text: cancelLabel,
          onTap: () {
            Navigator.of(context).pop();

            onCancel?.call();
          },
        ),
        ClindDialogButton.confirm(
          context,
          text: confirmLabel,
          onTap: () {
            Navigator.of(context).pop();

            onConfirm.call();
          },
        ),
      ],
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showRich(
    BuildContext context, {
    required Widget title,
    required List<Widget> buttons,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ClindDialog(
        title: title,
        buttons: buttons,
        barrierDismissible: barrierDismissible,
      ),
      barrierColor: barrierColor ?? context.colorScheme.black.withOpacity(0.4),
      barrierDismissible: barrierDismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 277.0,
        decoration: BoxDecoration(
          color: context.dialogTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      child: title,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Row(
                children: List.generate(
                  buttons.length,
                  (index) => Expanded(
                    child: buttons[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (barrierDismissible) {
      return PopScope(
        child: child,
      );
    }

    return child;
  }
}

class ClindDialogTitle extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const ClindDialogTitle(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.dialogTheme.titleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}

class ClindDialogButton extends StatelessWidget {
  final Widget text;
  final Color backgroundColor;
  final VoidCallback onTap;

  const ClindDialogButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
  });

  factory ClindDialogButton.cancel(
    BuildContext context, {
    String text = '취소',
    required VoidCallback onTap,
  }) {
    return ClindDialogButton(
      text: Text(
        text,
        style: context.dialogTheme.cancelTextStyle,
        textAlign: TextAlign.center,
      ),
      backgroundColor: context.dialogTheme.cancelBackgroundColor,
      onTap: onTap,
    );
  }

  factory ClindDialogButton.confirm(
    BuildContext context, {
    String text = '확인',
    required VoidCallback onTap,
  }) {
    return ClindDialogButton(
      text: Text(
        text,
        style: context.dialogTheme.confirmTextStyle,
        textAlign: TextAlign.center,
      ),
      backgroundColor: context.dialogTheme.confirmBackgroundColor,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: 43.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
