import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:feature_my/clind.dart';
import 'package:flutter/material.dart';
import 'package:my_domain/domain.dart';
import 'package:my_presentation/presentation.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/gen/gen.dart';
import 'package:tool_clind_theme/theme.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
    super.initState();
  }

  Future<void> _refresh() async {
    await context.readFlowBloc<MyCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      appBar: ClindAppBar(
        context: context,
        title: ClindAppBarTitle.simple(
          context,
          text: '마이페이지',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.5,
            ),
            child: ClindAppBarIconAction(
              icon: ClindIcon.logout(
                color: context.colorScheme.gray300,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: ClindDivider.horizontal(),
        ),
      ),
      body: SizedBox.expand(
        child: CustomScrollView(
          slivers: [
            FlowBlocBuilder<MyCubit, User>(
              builder: (context, state) {
                final User user = state.data ?? const User();
                return SliverToBoxAdapter(
                  child: MyProfileCard.item(
                    user,
                    onModify: () {},
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12.0,
              ),
            ),
            SliverList.list(
              children: [
                ClindSettingTile.simple(
                  context,
                  title: '로그인',
                  onTap: () {},
                ),
                ClindDivider.horizontal(),
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12.0,
              ),
            ),
            SliverList.list(
              children: [
                ClindSettingTile.icon(
                  context,
                  icon: ClindIcon.mail(
                    color: ColorName.mainRed,
                  ),
                  title: '간편하게 이직 제안 받기',
                  onTap: () {},
                ),
                ClindDivider.horizontal(),
                ClindSettingTile.icon(
                  context,
                  icon: ClindIcon.featuredSeasonalAndGifts(
                    color: ColorName.mainRed,
                  ),
                  title: '첫 콜라보 상품확인',
                  onTap: () {},
                ),
                ClindDivider.horizontal(),
                ClindSettingTile.icon(
                  context,
                  icon: ClindIcon.volunteerActivism(
                    color: ColorName.mainRed,
                  ),
                  title: '직장인끼리 소개팅하러 가기',
                  onTap: () {},
                ),
                ClindDivider.horizontal(),
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12.0,
              ),
            ),
            SliverList.list(
              children: [
                ClindSettingTile.icon(
                  context,
                  icon: ClindIcon.sourceEnvironment(
                    color: ColorName.mainRed,
                  ),
                  title: '기업 리뷰',
                  onTap: () {},
                ),
                ClindDivider.horizontal(),
                ClindSettingTile.icon(
                  context,
                  icon: ClindIcon.payments(
                    color: ColorName.mainRed,
                  ),
                  title: '연봉 등수 계산기',
                  onTap: () {},
                ),
                ClindDivider.horizontal(),
                ClindSettingTile.icon(
                  context,
                  icon: ClindIcon.doNotDisturbOn(
                    color: ColorName.mainRed,
                  ),
                  title: '키워드 글 숨기기',
                  onTap: () {},
                ),
                ClindDivider.horizontal(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
