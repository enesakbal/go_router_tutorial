import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model/user_model.dart';
import '../../services/user_service.dart';

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
