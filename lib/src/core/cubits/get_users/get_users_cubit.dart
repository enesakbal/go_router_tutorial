import '../../../../go_router_tutorial.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit({required this.userService}) : super(const GetUsersInitial());

  final UserService userService;

  Future<void> getUsers() async {
    emit(const GetUsersLoading());
    try {
      final users = await userService.getUsers();
      emit(GetUsersLoaded(users));
    } catch (e) {
      emit(GetUsersError(e.toString()));
    }
  }
}
