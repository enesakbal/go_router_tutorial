import 'package:go_router_tutorial/go_router_tutorial.dart';

import '../router/router.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Users')),
          body: switch (state) {
            GetUsersError(:final error) => Center(child: Text(error)),
            GetUsersLoaded(:final users) => _UsersListScreen(users: users),
            _ => const Center(child: CircularProgressIndicator()),
          },
        );
      },
    );
  }
}

class _UsersListScreen extends StatelessWidget {
  const _UsersListScreen({required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return ListTile(
          title: Text(user.name ?? ''),
          subtitle: Text(user.email ?? ''),
          leading: CircleAvatar(
            child: Text(user.name?.substring(0, 1) ?? ''),
          ),
          trailing: Text(user.company?.name ?? ''),
          onTap: () => context.go('${RouterConstants.path.userListScreen}/${user.id}'),
        );
      },
    );
  }
}
