import 'package:go_router_tutorial/go_router_tutorial.dart';

import '../../../router/router.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<GetPostsCubit, GetPostsState>(
        builder: (context, state) {
          return switch (state) {
            GetPostsError(:final message) => Center(child: Text(message)),
            GetPostsLoaded(:final posts) => _PostsListScreen(posts: posts),
            _ => const Center(child: CircularProgressIndicator()),
          };
        },
      ),
    );
  }
}

class _PostsListScreen extends StatelessWidget {
  const _PostsListScreen({required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];

        return ListTile(
          title: Text(
            post.title ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            post.body ?? '',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: CircleAvatar(child: Text(post.userId.toString())),
          onTap: () => context.go('${RouterConstants.route.posts}/${post.id}'),
        );
      },
    );
  }
}
