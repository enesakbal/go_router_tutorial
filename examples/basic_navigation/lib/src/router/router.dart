import 'package:go_router_tutorial/go_router_tutorial.dart';

import '../screens/splash_screen.dart';
import '../screens/user_detail_screen.dart';
import '../screens/user_list_screen.dart';
import 'router_constants.dart';

export 'router_constants.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouterConstants.path.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouterConstants.path.userListScreen,
      builder: (context, state) => const UserListScreen(),
      routes: [
        GoRoute(
          path: RouterConstants.path.userDetailScreen,
          builder: (context, state) => UserDetailScreen(
            id: int.tryParse(state.pathParameters['id'] ?? ''),
          ),
        ),
      ],
    ),
  ],
);

extension GoRouterX on BuildContext {
  GoRouter get router => GoRouter.of(this);
}
