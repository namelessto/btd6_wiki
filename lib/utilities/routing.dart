import 'package:btd6_wiki/presentation/screens/bloon_screen.dart';
import 'package:btd6_wiki/presentation/screens/bloons_screen.dart';
import 'package:btd6_wiki/presentation/screens/error_screen.dart';
import 'package:btd6_wiki/presentation/screens/hero_screen.dart';
import 'package:btd6_wiki/presentation/screens/heroes_screen.dart';
import 'package:btd6_wiki/presentation/screens/home_screen.dart';
import 'package:btd6_wiki/presentation/screens/tower_path_screen.dart';
import 'package:btd6_wiki/presentation/screens/tower_screen.dart';
import 'package:btd6_wiki/presentation/screens/towers_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter mainRouter = GoRouter(
  initialLocation: '/',
  routes: [
    homePage,
  ],
  debugLogDiagnostics: false,
  errorBuilder: (context, state) => ErrorScreen(state.error!),
);

final homePage = GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) {
      return const HomePage();
    },
    routes: [
      towersView,
      heroesView,
      bloonsView,
    ]);

// --- Towers Routes ---

final towersView = GoRoute(
  name: 'towers_view',
  path: 'towers_view',
  builder: (context, state) {
    String type = state.queryParams['type']!;
    return TowersView(
      type: type,
    );
  },
  routes: [towerView],
);

final towerView = GoRoute(
  name: 'tower_view',
  path: 'tower_view',
  builder: (context, state) {
    String type = state.queryParams['type']!;
    return TowerView(
      type: type,
    );
  },
  routes: [towerPath],
);

final towerPath = GoRoute(
  name: 'tower_path_view',
  path: 'tower_path_view',
  builder: (context, state) {
    String type = state.queryParams['type']!;
    String strIndex = state.queryParams['pathIndex']!;
    return TowerPathView(
      type: type,
      strIndex: strIndex,
    );
  },
);

// --- Heroes Routes ---

final heroesView = GoRoute(
  name: 'heroes_view',
  path: 'heroes_view',
  builder: (context, state) {
    return const HeroesView();
  },
  routes: [heroView],
);

final heroView = GoRoute(
  name: 'hero_view',
  path: 'hero_view',
  builder: (context, state) {
    return const HeroView();
  },
  //routes: [],
);

// --- Bloons Routes ---

final bloonsView = GoRoute(
  name: 'bloons_view',
  path: 'bloons_view',
  builder: (context, state) {
    return const BloonsView();
  },
  routes: [bloonView],
);

final bloonView = GoRoute(
  name: 'bloon_view',
  path: 'bloon_view',
  builder: (context, state) {
    return const BloonView();
  },
);
