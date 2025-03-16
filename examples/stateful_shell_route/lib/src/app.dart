import 'package:go_router_tutorial/go_router_tutorial.dart';

import 'router/router.dart';

class StatefulShellRouteApp extends StatelessWidget {
  const StatefulShellRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserService(dio: Dio())),
        RepositoryProvider(create: (context) => PostsService(dio: Dio())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GetUsersCubit(userService: context.read<UserService>())..getUsers()),
          BlocProvider(create: (context) => GetPostsCubit(postService: context.read<PostsService>())..getPosts()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
