import 'package:dio/dio.dart';

import '../models/user_model/user_model.dart';

class UserService {
  UserService({required this.dio});

  final Dio dio;

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get<List<dynamic>>('https://jsonplaceholder.typicode.com/users');
      final userList = response.data?.map((e) => UserModel.fromMap(e as Map<String, dynamic>)).toList();

      return userList ?? [];
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUser(int id) async {
    try {
      final response = await dio.get<Map<String, dynamic>>('https://jsonplaceholder.typicode.com/users/$id');
      final user = UserModel.fromMap(response.data ?? {});

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
