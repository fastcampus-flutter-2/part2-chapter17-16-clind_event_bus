import 'package:my_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_theme/gen/gen.dart';
import 'package:tool_clind_theme/theme.dart';

class MyProfileCard extends StatelessWidget {
  final String name;
  final VoidCallback onModify;
  final int postCount;
  final int commentCount;
  final int likeCount;

  const MyProfileCard({
    super.key,
    required this.name,
    required this.onModify,
    this.postCount = 0,
    this.commentCount = 0,
    this.likeCount = 0,
  });

  factory MyProfileCard.item(
    User user, {
    required VoidCallback onModify,
  }) {
    return MyProfileCard(
      name: user.name,
      onModify: onModify,
      postCount: user.postCount,
      commentCount: user.commentCount,
      likeCount: user.likeCount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorName.profileCardBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    name,
                    style: context.textTheme.default22Regular.copyWith(
                      letterSpacing: 0.01,
                      color: context.colorScheme.gray100,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14.0,
                ),
                GestureDetector(
                  onTap: () => onModify.call(),
                  behavior: HitTestBehavior.translucent,
                  child: ColoredBox(
                    color: ColorName.profileCardButtonBackground,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 8.0,
                      ),
                      child: Text(
                        '수정',
                        style: context.textTheme.default12Medium.copyWith(
                          color: context.colorScheme.gray200,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            ColoredBox(
              color: ColorName.profileCardDetailBackground,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 14.0,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '지난 3개월 간 글 $postCount개, 댓글 $commentCount개 를 작성하고, 좋아요 $likeCount개를 받으셨습니다.',
                      ),
                      const TextSpan(
                        text: '\n\n',
                      ),
                      const TextSpan(
                        text: '솔직한 이야기를 나누고, 더 많은 글에 공감하고 참여해서',
                      ),
                      const TextSpan(
                        text: '\n',
                      ),
                      const TextSpan(
                        text: 'MVP',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(
                        text: '가 되어보세요!',
                      ),
                    ],
                    style: context.textTheme.default14Regular.copyWith(
                      color: context.colorScheme.gray500,
                      height: 16.8 / 14.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
