part of 'get_posts_cubit.dart';

sealed class GetPostsState extends Equatable {
  const GetPostsState();

  @override
  List<Object> get props => [];
}

final class GetPostsInitial extends GetPostsState {
  const GetPostsInitial();

  @override
  List<Object> get props => [];
}

final class GetPostsLoading extends GetPostsState {
  const GetPostsLoading();

  @override
  List<Object> get props => [];
}

final class GetPostsLoaded extends GetPostsState {
  const GetPostsLoaded({required this.posts});

  final List<PostModel> posts;

  @override
  List<Object> get props => [posts];
}

final class GetPostsError extends GetPostsState {
  const GetPostsError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
