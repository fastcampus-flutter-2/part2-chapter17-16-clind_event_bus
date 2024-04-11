import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class ClindPostCard extends StatelessWidget {
  final String imageUrl;
  final String channel;
  final String company;
  final DateTime createdAt;
  final String title;
  final String content;
  final List<String> thumbnailUrls;
  final bool isLike;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final VoidCallback onChannelTapped;
  final VoidCallback onCompanyTapped;
  final VoidCallback onLikeTapped;
  final VoidCallback onCommentTapped;
  final VoidCallback onViewTapped;
  final VoidCallback onTap;

  ClindPostCard({
    super.key,
    required this.imageUrl,
    required this.channel,
    required this.company,
    required this.createdAt,
    required this.title,
    this.content = '',
    List<String>? thumbnailUrls,
    this.isLike = false,
    this.likeCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    required this.onChannelTapped,
    required this.onCompanyTapped,
    required this.onLikeTapped,
    required this.onCommentTapped,
    required this.onViewTapped,
    required this.onTap,
  }) : thumbnailUrls = thumbnailUrls?.where((url) => url.isWebUrl).toList() ?? [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: ColoredBox(
        color: context.colorScheme.bg2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 27.0,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClindProfileTile(
                      imageUrl: imageUrl,
                      channel: channel,
                      company: company,
                      createdAt: createdAt,
                      onChannelTapped: () => onChannelTapped.call(),
                      onCompanyTapped: () => onCompanyTapped.call(),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: context.textTheme.default17Medium.copyWith(
                                    color: context.colorScheme.gray100,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 11.0,
                                ),
                                Flexible(
                                  child: Text(
                                    content,
                                    style: context.textTheme.default15Regular.copyWith(
                                      color: context.colorScheme.gray400,
                                      height: 18.75 / 15.0,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (thumbnailUrls.isNotEmpty) ...[
                            const SizedBox(
                              width: 29.0,
                            ),
                            ClindThumbnailImage(
                              imageUrls: thumbnailUrls,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ClindCardButton.like(
                    context,
                    count: likeCount,
                    isSelected: isLike,
                    onTap: () => onLikeTapped.call(),
                  ),
                ),
                Expanded(
                  child: ClindCardButton.comment(
                    context,
                    count: commentCount,
                    onTap: () => onCommentTapped.call(),
                  ),
                ),
                Expanded(
                  child: ClindCardButton.view(
                    context,
                    count: viewCount,
                    onTap: () => onViewTapped.call(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClindLoadingPostCard extends StatelessWidget {
  const ClindLoadingPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      baseColor: context.colorScheme.gray800,
      highlightColor: context.colorScheme.gray900,
      child: SizedBox(
        height: 217.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 27.0,
              ),
              Row(
                children: [
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: context.colorScheme.gray800,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    width: 88.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: context.colorScheme.gray800,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: context.colorScheme.gray800,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        const SizedBox(
                          height: 9.0,
                        ),
                        Container(
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: context.colorScheme.gray800,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        const SizedBox(
                          height: 9.0,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 139.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: context.colorScheme.gray800,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 17.0,
                  ),
                  Container(
                    width: 88.0,
                    height: 79.0,
                    decoration: BoxDecoration(
                      color: context.colorScheme.gray800,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
