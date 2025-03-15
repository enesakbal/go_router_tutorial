import '../../../../go_router_tutorial.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit({required this.postService}) : super(const GetPostsInitial());

  final PostsService postService;

  Future<void> getPosts() async {
    emit(const GetPostsLoading());
    try {
      final posts = await postService.getPosts();
      emit(GetPostsLoaded(posts: posts));
    } catch (e) {
      emit(GetPostsError(message: e.toString()));
    }
  }
}
