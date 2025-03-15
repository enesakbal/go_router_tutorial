import 'package:go_router_tutorial/go_router_tutorial.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({required this.id, super.key});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserDetailCubit(userService: context.read<UserService>())..getUser(id),
      child: BlocBuilder<GetUserDetailCubit, GetUserDetailState>(
        builder: (context, state) {
          return Scaffold(
            body: switch (state) {
              GetUserDetailError(:final error) => Center(child: Text(error)),
              GetUserDetailLoaded(:final user) => _UserDetailScreen(user: user),
              _ => const Center(child: CircularProgressIndicator()),
            },
          );
        },
      ),
    );
  }
}

class _UserDetailScreen extends StatelessWidget {
  const _UserDetailScreen({required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Detail')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Card(
              child: ListTile(
                title: Text(
                  user.name ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  user.email ?? '',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                leading: CircleAvatar(
                  child: Text(user.name?.substring(0, 1) ?? ''),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Card(
              child: ListTile(
                title: Text(
                  user.phone ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  user.website ?? '',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                leading: const Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Company Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Card(
              child: ListTile(
                title: Text(
                  user.company?.name ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  user.company?.catchPhrase ?? '',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                leading: const Icon(
                  Icons.business,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Card(
              child: ListTile(
                title: Text(user.address?.street ?? ''),
                subtitle: Text(user.address?.city ?? ''),
                trailing: Text(user.address?.zipcode ?? ''),
                leading: const Icon(Icons.location_on),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
