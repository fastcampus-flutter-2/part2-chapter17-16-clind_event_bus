import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

enum ClindNavigationType {
  home(title: '홈'),
  notification(title: '알림'),
  my(title: '마이페이지');

  final String title;

  const ClindNavigationType({
    required this.title,
  });
}

class ClindBottomNavigationItem {
  final ClindNavigationType type;

  const ClindBottomNavigationItem({
    required this.type,
  });

  factory ClindBottomNavigationItem.home() {
    return const ClindBottomNavigationItem(
      type: ClindNavigationType.home,
    );
  }

  factory ClindBottomNavigationItem.notification() {
    return const ClindBottomNavigationItem(
      type: ClindNavigationType.notification,
    );
  }

  factory ClindBottomNavigationItem.my() {
    return const ClindBottomNavigationItem(
      type: ClindNavigationType.my,
    );
  }
}

class ClindBottomNavigationBar extends StatelessWidget {
  final List<ClindBottomNavigationItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const ClindBottomNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClindDivider.horizontal(),
        SizedBox(
          height: context.navigationBarThemeData.height + MediaQuery.viewPaddingOf(context).bottom,
          child: ColoredBox(
            color: context.colorScheme.darkBlack,
            child: Padding(
              padding: EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: MediaQuery.viewPaddingOf(context).bottom,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  items.length,
                  (index) {
                    final ClindBottomNavigationItem item = items[index];
                    final bool isSelected = index == currentIndex;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onTap.call(index),
                        behavior: HitTestBehavior.translucent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClindNavigationTypeIcon(
                              type: item.type,
                              isSelected: isSelected,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              item.type.title,
                              style: isSelected
                                  ? context.textTheme.default11Regular.copyWith(
                                      color: context.colorScheme.gray100,
                                    )
                                  : context.textTheme.default11Light.copyWith(
                                      color: context.colorScheme.gray200,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClindNavigationTypeIcon extends StatelessWidget {
  final ClindNavigationType type;
  final bool isSelected;

  const ClindNavigationTypeIcon({
    super.key,
    required this.type,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = context.colorScheme.white;

    if (isSelected) {
      return switch (type) {
        ClindNavigationType.home => ClindIcon.homeOn(color: color),
        ClindNavigationType.notification => ClindIcon.notificationsOn(color: color),
        ClindNavigationType.my => ClindIcon.personOn(color: color),
      };
    }

    return switch (type) {
      ClindNavigationType.home => ClindIcon.homeOff(color: color),
      ClindNavigationType.notification => ClindIcon.notificationsOff(color: color),
      ClindNavigationType.my => ClindIcon.personOff(color: color),
    };
  }
}

class ClindChatBottomNavigationBar extends StatefulWidget {
  final String hintText;
  final int minLines;
  final int maxLines;
  final Function(String) onSend;

  const ClindChatBottomNavigationBar({
    super.key,
    this.hintText = '',
    this.minLines = 1,
    this.maxLines = 4,
    required this.onSend,
  });

  @override
  State<ClindChatBottomNavigationBar> createState() => _ClindChatBottomNavigationBarState();
}

class _ClindChatBottomNavigationBarState extends State<ClindChatBottomNavigationBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double threshold = MediaQuery.viewPaddingOf(context).bottom + 50.0;
    final double bottomPadding = MediaQuery.viewPaddingOf(context).bottom;
    final double keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    final bool hasKeyboard = MediaQuery.viewInsetsOf(context).bottom > threshold;

    return Container(
      height: 82.0 + (hasKeyboard ? keyboardHeight : bottomPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.bg2,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: hasKeyboard ? keyboardHeight : bottomPadding,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 17.0,
          ),
          ClindIcon.imagesMode(
            color: context.colorScheme.gray400,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: CoreTextField(
              controller: _controller,
              cursorColor: context.colorScheme.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: context.textTheme.default15SemiBold.copyWith(
                  color: context.colorScheme.gray600,
                ),
              ),
              style: context.textTheme.default15SemiBold.copyWith(
                color: context.colorScheme.gray200,
              ),
              keyboardAppearance: context.colorScheme.brightness,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          GestureDetector(
            onTap: () {
              widget.onSend.call(_controller.text);
              _controller.clear();
            },
            behavior: HitTestBehavior.translucent,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.gray200,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '전송',
                  style: context.textTheme.default15SemiBold.copyWith(
                    color: context.colorScheme.gray200,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
