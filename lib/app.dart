import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'core/routes/app_router.dart';
import 'core/utils/di.dart';
import 'features/home/data/repos/home_repo.dart';
import 'features/home/presentation/view_model/groups_cubit/groups_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(getIt.get<HomeRepo>()),
        ),
        BlocProvider(
          create: (context) => GroupsCubit(getIt.get<HomeRepo>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
