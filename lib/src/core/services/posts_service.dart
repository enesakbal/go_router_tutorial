import 'package:dio/dio.dart';

import '../models/post_model/post_model.dart';

class PostsService {
  PostsService({required this.dio});

  final Dio dio;

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get<List<dynamic>>('https://jsonplaceholder.typicode.com/posts');
      return response.data?.map((e) => PostModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];
    } on Exception {
      rethrow;
    }
  }

  Future<List<PostModel>> getPostsByUserId(int userId) async {
    try {
      final response = await dio.get<List<dynamic>>('https://jsonplaceholder.typicode.com/posts?userId=$userId');
      return response.data?.map((e) => PostModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];
    } on Exception {
      rethrow;
    }
  }

  Future<PostModel> getPost(int id) async {
    try {
      final response = await dio.get<Map<String, dynamic>>('https://jsonplaceholder.typicode.com/posts/$id');

      return PostModel.fromJson(response.data ?? {});
    } on Exception {
      rethrow;
    }
  }
}
