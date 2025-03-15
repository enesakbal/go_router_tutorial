import '../../../../go_router_tutorial.dart';

part 'get_post_detail_state.dart';

class GetPostDetailCubit extends Cubit<GetPostDetailState> {
  GetPostDetailCubit({required this.postService}) : super(const GetPostDetailInitial());

  final PostsService postService;

  Future<void> getPostDetail(int? id) async {
    emit(const GetPostDetailLoading());
    try {
      if (id == null) {
        emit(const GetPostDetailError(message: 'Post ID is required'));
        return;
      }

      final post = await postService.getPost(id);
      emit(GetPostDetailLoaded(post: post));
    } catch (e) {
      emit(GetPostDetailError(message: e.toString()));
    }
  }
}
