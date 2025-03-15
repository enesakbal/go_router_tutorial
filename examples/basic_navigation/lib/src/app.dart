import 'package:go_router_tutorial/go_router_tutorial.dart';

import 'router/router.dart';

class BasicNavigationApp extends StatelessWidget {
  const BasicNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserService(dio: Dio()),
      child: BlocProvider(
        create: (context) => GetUsersCubit(userService: context.read<UserService>())..getUsers(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
