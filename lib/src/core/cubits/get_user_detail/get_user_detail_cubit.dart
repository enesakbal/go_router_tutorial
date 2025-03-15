import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model/user_model.dart';
import '../../services/user_service.dart';

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
