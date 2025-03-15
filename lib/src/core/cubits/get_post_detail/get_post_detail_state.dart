part of 'get_post_detail_cubit.dart';

sealed class GetPostDetailState extends Equatable {
  const GetPostDetailState();

  @override
  List<Object> get props => [];
}

final class GetPostDetailInitial extends GetPostDetailState {
  const GetPostDetailInitial();

  @override
  List<Object> get props => [];
}

final class GetPostDetailLoading extends GetPostDetailState {
  const GetPostDetailLoading();

  @override
  List<Object> get props => [];
}

final class GetPostDetailLoaded extends GetPostDetailState {
  const GetPostDetailLoaded({required this.post});

  final PostModel post;

  @override
  List<Object> get props => [post];
}

final class GetPostDetailError extends GetPostDetailState {
  const GetPostDetailError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
