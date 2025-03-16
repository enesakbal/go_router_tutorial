abstract class RouterConstants {
  const RouterConstants._();

  static const path = _Path();
  static const route = _Route();
}

class _Path {
  const _Path();

  String get splash => '/';

  String get users => '/users';
  String get userDetail => '/:id';

  String get settings => '/settings';
  String get posts => '/posts';
  String get postDetail => '/:id';
}

class _Route {
  const _Route();

  String get splash => '/';

  String get users => '/users';
  String get userDetail => '/users/:id';
  String get settings => '/settings';
  String get posts => '/posts';
  String get postDetail => '/posts/:id';
}
