import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:blocjson/core/services/dio/utils/failure.dart';
import 'package:blocjson/core/services/dio/utils/success.dart';
import 'package:blocjson/modules/posts/model/post_model.dart';
import 'package:blocjson/modules/posts/repository/posts_repository.dart';

class PostsRepositoryImplements implements PostsRepository {
  final Dio dio;
  PostsRepositoryImplements({
    required this.dio,
  });
  @override
  Future<Either<Failure, Success<PostsModel>>> createPost({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) async {
    try {
      final response = await dio.post("/posts", data: {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      });
      if (response.statusCode == 200 &&
          (response.data != null) &&
          (response.data as Map).containsKey("id")) {
        return Right(
          Success(PostsModel.fromMap(response.data)),
        );
      } else {
        return Left(
          Failure(
            status: response.statusCode ?? 0,
            message: response.statusMessage ?? "Ops! Algo deu errado!",
            type: "Server Error",
            exception: null,
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          status: 500,
          message:
              "Ocorreu um erro interno. Entre em contato com a Dourado Cash.",
          type: "Internal Error",
          exception: e,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Success<List<PostsModel>>>> getPosts() async {
    try {
      final response = await dio.get("/posts");
      List<PostsModel> postsList = [];
      if (response.statusCode == 200) {
        if ((response.data != null) && (response.data as List).isNotEmpty) {
          postsList = (response.data as List)
              .map((e) => PostsModel.fromMap(e))
              .toList();
        }
        return Right(Success(postsList));
      } else {
        return Left(
          Failure(
            exception: null,
            message: response.statusMessage ?? 'Ops! Algo deu errado!',
            status: response.statusCode ?? 0,
            type: 'Server Error',
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          status: 500,
          message:
              "Não foi possível buscar suas carteiras no momento. Por favor, tente novamente..",
          type: "Internal Error",
          exception: e,
        ),
      );
    }
  }
}
