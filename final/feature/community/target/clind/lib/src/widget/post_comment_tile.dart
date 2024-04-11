import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class PostCommentTile extends StatelessWidget {
  final String name;
  final String company;
  final String content;
  final DateTime createdAt;
  final VoidCallback onTap;

  const PostCommentTile({
    super.key,
    required this.name,
    required this.company,
    required this.content,
    required this.createdAt,
    required this.onTap,
  });

  factory PostCommentTile.item(
    Comment comment, {
    required VoidCallback onTap,
  }) {
    return PostCommentTile(
      name: comment.user.name,
      company: comment.user.company,
      content: comment.content,
      createdAt: comment.createdAt,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name · $company',
                style: context.textTheme.default14Regular.copyWith(
                  color: context.colorScheme.gray500,
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                content,
                style: context.textTheme.default15Regular.copyWith(
                  color: context.colorScheme.gray200,
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                createdAt.toTimeAgo(),
                style: context.textTheme.default15Regular.copyWith(
                  color: context.colorScheme.gray400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostCommentListView extends StatelessWidget {
  final List<Comment> items;
  final Function(Comment) onTap;
  final bool isLoadMore;

  const PostCommentListView({
    super.key,
    required this.items,
    required this.onTap,
    this.isLoadMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final Comment item = items[index];
        final Widget child = PostCommentTile.item(
          item,
          onTap: () => onTap.call(item),
        );
        if (isLoadMore) {
          if (index == items.length - 1) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: Center(
                    child: ClindIcon.restartAlt(
                      size: 44.0,
                      color: context.colorScheme.gray600,
                    ),
                  ),
                ),
              ],
            );
          }
        }
        return child;
      },
    );
  }
}
