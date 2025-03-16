import 'package:go_router_tutorial/go_router_tutorial.dart';

import '../screens/master/master_screen.dart';
import '../screens/master/posts/posts_detail_screen.dart';
import '../screens/master/posts/posts_screen.dart';
import '../screens/master/settings/settings_screen.dart';
import '../screens/master/users/user_detail_screen.dart';
import '../screens/master/users/users_screen.dart';
import '../screens/splash_screen.dart';
import 'router_constants.dart';

export 'router_constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _masterNavigatorKey = GlobalKey<StatefulNavigationShellState>();

final _usersNavigatorKey = GlobalKey<NavigatorState>();
final _postsNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: RouterConstants.path.splash,
  routes: [
    GoRoute(
      path: RouterConstants.path.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      key: _masterNavigatorKey,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (_, __, navigationShell) => MaterialPage(
        child: MasterScreen(shell: navigationShell),
      ),
      // builder: ,
      branches: [
        StatefulShellBranch(
          navigatorKey: _usersNavigatorKey,
          preload: true,
          routes: [
            GoRoute(
              parentNavigatorKey: _usersNavigatorKey,
              path: RouterConstants.path.users,
              builder: (context, state) => const UsersScreen(),
              routes: [
                GoRoute(
                  parentNavigatorKey: _usersNavigatorKey,
                  path: RouterConstants.path.userDetail,
                  builder: (context, state) => UserDetailScreen(
                    //* UniqueKey() is required for refresh the page
                    key: UniqueKey(),
                    id: int.parse(state.pathParameters['id'] ?? ''),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _postsNavigatorKey,
          preload: true,
          routes: [
            GoRoute(
              parentNavigatorKey: _postsNavigatorKey,
              path: RouterConstants.path.posts,
              builder: (context, state) => const PostsScreen(),
              routes: [
                GoRoute(
                  parentNavigatorKey: _postsNavigatorKey,
                  path: RouterConstants.path.postDetail,
                  builder: (context, state) => PostsDetailScreen(
                    id: int.parse(state.pathParameters['id'] ?? ''),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          preload: true,
          routes: [
            GoRoute(
              parentNavigatorKey: _settingsNavigatorKey,
              path: RouterConstants.path.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

extension GoRouterX on BuildContext {
  GoRouter get router => GoRouter.of(this);
}
