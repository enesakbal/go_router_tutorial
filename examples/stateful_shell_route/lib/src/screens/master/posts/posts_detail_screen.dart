import 'package:go_router_tutorial/go_router_tutorial.dart';

import '../../../router/router.dart';

class PostsDetailScreen extends StatelessWidget {
  const PostsDetailScreen({required this.id, super.key});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPostDetailCubit(postService: context.read<PostsService>())..getPostDetail(id),
      child: Scaffold(
        body: BlocBuilder<GetPostDetailCubit, GetPostDetailState>(
          builder: (context, state) {
            return switch (state) {
              GetPostDetailError(:final message) => Center(child: Text(message)),
              GetPostDetailLoaded(:final post) => _PostDetailScreen(post: post),
              _ => const Center(child: CircularProgressIndicator()),
            };
          },
        ),
      ),
    );
  }
}

class _PostDetailScreen extends StatelessWidget {
  const _PostDetailScreen({required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(post.body ?? '', style: const TextStyle(fontSize: 16)),

            ///TEST
            Center(
              child: ElevatedButton(
                onPressed: () => context.router.go(RouterConstants.route.settings),
                child: const Text('Go to Settings Branch'),
              ),
            ),

            Center(
              child: ElevatedButton(
                onPressed: () => context.router.push('${RouterConstants.route.users}/5'),
                child: const Text('Go to User 5 in Posts Branch'),
              ),
            ),

            Center(
              child: ElevatedButton(
                onPressed: () => context.router.go('${RouterConstants.route.users}/5'),
                child: const Text('Go to User 5 in Users Branch'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
