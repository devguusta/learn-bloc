import 'package:blocjson/core/services/dio/utils/failure.dart';
import 'package:blocjson/core/services/dio/utils/success.dart';
import 'package:blocjson/modules/posts/model/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either<Failure, Success<List<PostsModel>>>> getPosts();
  Future<Either<Failure, Success<PostsModel>>> createPost({
    required int userId,
    required int id,
    required String title,
    required String body,
  });
}
