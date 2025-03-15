import 'package:go_router_tutorial/go_router_tutorial.dart';

import '../router/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        if (!mounted) return;

        context.go(RouterConstants.path.userListScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Basic Navigation Splash Screen'),
      ),
    );
  }
}
