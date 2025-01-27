import 'package:color_order_match/presentation/game/screen/game_root.dart';
import 'package:color_order_match/presentation/home/home_screen.dart';
import 'package:color_order_match/presentation/ready/ready_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/ready',
      builder: (context, state) => const ReadyScreen(),
    ),
    GoRoute(
      path: '/game/:colorGroup',
      builder: (context, state) {
        final colorGroup = int.parse(state.pathParameters['colorGroup']!);
        return GameRoot(
          colorGroup: colorGroup,
        );
      },
    ),
  ],
);
