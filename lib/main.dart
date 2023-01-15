import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:btd6_wiki/business_logic/cubit/bloon_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/bloons_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/hero_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/heroes_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/ids_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/towers_cubit.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:btd6_wiki/utilities/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp(btdRepo: BTDRepo()));
}

final GoRouter _router = mainRouter;

class MyApp extends StatelessWidget {
  final BTDRepo btdRepo;

  const MyApp({super.key, required this.btdRepo});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TowerCubit>(
          create: (towerContext) => TowerCubit(btdRepo: btdRepo),
        ),
        BlocProvider<HeroCubit>(
          create: (heroContext) => HeroCubit(btdRepo: btdRepo),
        ),
        BlocProvider<IdsCubit>(
          create: (idsContext) => IdsCubit(btdRepo: btdRepo),
        ),
        BlocProvider<TowersCubit>(
          create: (idsContext) => TowersCubit(btdRepo: btdRepo),
        ),
        BlocProvider<HeroesCubit>(
          create: (idsContext) => HeroesCubit(btdRepo: btdRepo),
        ),
        BlocProvider<BloonsCubit>(
          create: (idsContext) => BloonsCubit(btdRepo: btdRepo),
        ),
        BlocProvider<BloonCubit>(
          create: (idsContext) => BloonCubit(btdRepo: btdRepo),
        ),
      ],
      child: AdaptiveTheme(
        light: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(),
          brightness: Brightness.light,
        ),
        dark: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.dark(),
          brightness: Brightness.dark,
        ),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp.router(
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: _router,
        ),
      ),
    );
  }
}
