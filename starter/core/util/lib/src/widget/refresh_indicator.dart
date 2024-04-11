import 'dart:math';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double kCoreRefreshIndicatorSize = 56.0;

class CoreRefreshIndicator extends StatefulWidget {
  final Widget child;
  final Widget? indicator;
  final AsyncCallback onRefresh;
  final double displacement;
  final double edgeOffset;

  const CoreRefreshIndicator({
    super.key,
    required this.child,
    this.indicator,
    required this.onRefresh,
    this.displacement = 40.0,
    this.edgeOffset = 0.0,
  });

  @override
  State<CoreRefreshIndicator> createState() => _CoreRefreshIndicatorState();
}

class _CoreRefreshIndicatorState extends State<CoreRefreshIndicator> {
  final IndicatorController _controller = IndicatorController(
    refreshEnabled: true,
  );

  final ValueNotifier<double> _ratioValueNotifier = ValueNotifier<double>(0.0);

  double get _indicatorSize => widget.indicator != null ? kCoreRefreshIndicatorSize : 0.0;

  double get _displacement => widget.indicator != null ? widget.displacement : 0.0;

  @override
  void initState() {
    _controller.addListener(_updateRatio);
    super.initState();
  }

  @override
  void dispose() {
    _ratioValueNotifier.dispose();
    _controller.removeListener(_updateRatio);
    _controller.dispose();
    super.dispose();
  }

  void _updateRatio() {
    _ratioValueNotifier.value = _controller.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      controller: _controller,
      indicatorBuilder: (context, controller) => widget.indicator ?? const SizedBox.shrink(),
      elevation: 0.0,
      displacement: _displacement,
      edgeOffset: widget.edgeOffset,
      backgroundColor: const Color(0x00000000),
      onRefresh: widget.onRefresh,
      child: ValueListenableBuilder<double>(
        valueListenable: _ratioValueNotifier,
        builder: (context, ratio, child) {
          final double topPadding = (_indicatorSize + _displacement) * ratio;
          return Padding(
            padding: EdgeInsets.only(top: max(0, topPadding)),
            child: child!,
          );
        },
        child: widget.child,
      ),
    );
  }
}
