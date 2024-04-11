import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class SplashBlocProvider extends StatelessWidget {
  final Widget child;

  const SplashBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FlowRepositoryProvider<IFirebaseRemoteDataSource>(
      create: (context) => FirebaseRemoteDataSource(),
      child: FlowRepositoryProvider<FirebaseDataSource>(
        create: (context) => FirebaseDataSource(
          context.readFlowRepository<IFirebaseRemoteDataSource>(),
        ),
        child: FlowRepositoryProvider<IFirebaseRepository>(
          create: (context) => FirebaseRepository(
            context.readFlowRepository<FirebaseDataSource>(),
          ),
          child: FlowRepositoryProvider<GetAdImageUseCase>(
            create: (context) => GetAdImageUseCase(
              context.readFlowRepository<IFirebaseRepository>(),
            ),
            child: FlowBlocProvider<AdCubit>(
              create: (context) => AdCubit(
                context.readFlowRepository<GetAdImageUseCase>(),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
