abstract class RouterConstants {
  const RouterConstants._();

  static const path = _Path();
}

class _Path {
  const _Path();

  String get splashScreen => '/';
  String get userListScreen => '/user-list';
  String get userDetailScreen => '/:id';
}
