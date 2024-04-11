import 'package:flutter/material.dart';

class CoreLoadMore extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onLoadMore;
  final double threshold;

  const CoreLoadMore({
    super.key,
    required this.child,
    required this.onLoadMore,
    this.threshold = 0.8,
  }) : assert(threshold > 0.0 && threshold <= 1.0);

  @override
  State<CoreLoadMore> createState() => _CoreLoadMoreState();
}

class _CoreLoadMoreState extends State<CoreLoadMore> {
  bool _isLoadMore = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          _loadMore(notification.metrics);
        }
        return false;
      },
      child: widget.child,
    );
  }

  Future<void> _loadMore(ScrollMetrics metrics) async {
    if (_isLoadMore) return;
    if (metrics.maxScrollExtent <= 0.0) return;

    final bool isActive = (metrics.pixels / metrics.maxScrollExtent) >= widget.threshold;
    if (!isActive) return;

    _isLoadMore = true;
    await widget.onLoadMore.call();
    _isLoadMore = false;
  }
}
