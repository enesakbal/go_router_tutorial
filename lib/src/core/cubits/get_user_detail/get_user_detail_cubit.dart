import '../../../../go_router_tutorial.dart';

part 'get_user_detail_state.dart';

class GetUserDetailCubit extends Cubit<GetUserDetailState> {
  GetUserDetailCubit({required this.userService}) : super(const GetUserDetailInitial());

  final UserService userService;

  Future<void> getUser(int? id) async {
    emit(const GetUserDetailLoading());
    try {
      if (id == null) {
        emit(const GetUserDetailError('User ID is required'));
        return;
      }

      final user = await userService.getUser(id);
      emit(GetUserDetailLoaded(user));
    } catch (e) {
      emit(GetUserDetailError(e.toString()));
    }
  }
}
