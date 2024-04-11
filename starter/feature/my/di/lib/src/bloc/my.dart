import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_data/data.dart';
import 'package:my_domain/domain.dart';
import 'package:my_presentation/presentation.dart';
import 'package:tool_clind_network/network.dart';

class MyBlocProvider extends StatelessWidget {
  final Widget child;

  const MyBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FlowRepositoryProvider<IProfileRemoteDataSource>(
      create: (context) => ProfileRemoteDataSource(ProfileApi(ClindRestClient())),
      child: FlowRepositoryProvider<MyDataSource>(
        create: (context) => MyDataSource(
          context.readFlowRepository<IProfileRemoteDataSource>(),
        ),
        child: FlowRepositoryProvider<IMyRepository>(
          create: (context) => MyRepository(
            context.readFlowRepository<MyDataSource>(),
          ),
          child: FlowRepositoryProvider<GetMyUseCase>(
            create: (context) => GetMyUseCase(
              context.readFlowRepository<IMyRepository>(),
            ),
            child: FlowBlocProvider<MyCubit>(
              create: (context) => MyCubit(
                context.readFlowRepository<GetMyUseCase>(),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
