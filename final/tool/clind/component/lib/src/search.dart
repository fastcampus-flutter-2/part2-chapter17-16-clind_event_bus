import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindSearchBar extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ClindSearchBar({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 38.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.darkGray,
          borderRadius: BorderRadius.circular(19.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClindIcon.search(
              color: context.colorScheme.gray400,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Text(
                text,
                style: context.textTheme.default15Medium.copyWith(
                  color: context.colorScheme.gray400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClindLoadingSearchBar extends StatelessWidget {
  const ClindLoadingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      baseColor: context.colorScheme.gray800,
      highlightColor: context.colorScheme.gray900,
      child: Container(
        height: 38.0,
        decoration: BoxDecoration(
          color: context.colorScheme.gray800,
          borderRadius: BorderRadius.circular(19.0),
        ),
      ),
    );
  }
}

class ClindSearchTextField extends StatefulWidget {
  final String text;
  final String hintText;
  final Function(String) onSearch;

  const ClindSearchTextField({
    super.key,
    this.text = '',
    this.hintText = '',
    required this.onSearch,
  });

  @override
  State<ClindSearchTextField> createState() => _ClindSearchTextFieldState();
}

class _ClindSearchTextFieldState extends State<ClindSearchTextField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.text,
  );
  final FocusNode _focusNode = FocusNode();
  late final ValueNotifier<String> _textNotifier = ValueNotifier<String>(widget.text);

  @override
  void initState() {
    _controller.addListener(_changeText);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_changeText);
    _controller.dispose();
    _focusNode.dispose();
    _textNotifier.dispose();
    super.dispose();
  }

  void _changeText() {
    _updateText(_controller.text);
  }

  void _updateText(String text) {
    if (_textNotifier.value == text) return;
    _textNotifier.value = text;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CoreTextField(
            controller: _controller,
            focusNode: _focusNode,
            cursorColor: context.colorScheme.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: context.textTheme.default16Regular.copyWith(
                color: context.colorScheme.gray600,
              ),
            ),
            style: context.textTheme.default16Regular.copyWith(
              color: context.colorScheme.gray200,
            ),
            keyboardAppearance: context.colorScheme.brightness,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            onSubmitted: (value) => _onSearch(),
            onEditingComplete: () => _onSearch(),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        ValueListenableBuilder<String>(
          valueListenable: _textNotifier,
          builder: (context, value, child) {
            if (value.isEmpty) return const SizedBox.shrink();
            return child!;
          },
          child: GestureDetector(
            onTap: () => _controller.clear(),
            behavior: HitTestBehavior.translucent,
            child: ClindIcon.cancel(
              color: context.colorScheme.gray200,
            ),
          ),
        ),
      ],
    );
  }

  void _onSearch() {
    _hideKeyboard();

    final String text = _textNotifier.value;
    widget.onSearch.call(text);
  }

  void _hideKeyboard() {
    _focusNode.unfocus();
  }
}
