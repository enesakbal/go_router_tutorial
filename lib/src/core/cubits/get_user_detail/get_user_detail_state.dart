part of 'get_user_detail_cubit.dart';

sealed class GetUserDetailState extends Equatable {
  const GetUserDetailState();

  @override
  List<Object> get props => [];
}

final class GetUserDetailInitial extends GetUserDetailState {
  const GetUserDetailInitial();

  @override
  List<Object> get props => [];
}

final class GetUserDetailLoading extends GetUserDetailState {
  const GetUserDetailLoading();

  @override
  List<Object> get props => [];
}

final class GetUserDetailLoaded extends GetUserDetailState {
  const GetUserDetailLoaded(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

final class GetUserDetailError extends GetUserDetailState {
  const GetUserDetailError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
