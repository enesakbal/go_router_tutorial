part of 'get_users_cubit.dart';

sealed class GetUsersState extends Equatable {
  const GetUsersState();

  @override
  List<Object> get props => [];
}

final class GetUsersInitial extends GetUsersState {
  const GetUsersInitial();

  @override
  List<Object> get props => [];
}

final class GetUsersLoading extends GetUsersState {
  const GetUsersLoading();
}

final class GetUsersLoaded extends GetUsersState {
  const GetUsersLoaded(this.users);

  final List<UserModel> users;

  @override
  List<Object> get props => [users];
}

final class GetUsersError extends GetUsersState {
  const GetUsersError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
