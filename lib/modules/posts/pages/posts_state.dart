import 'package:blocjson/core/services/dio/utils/failure.dart';

abstract class PostsState {}

class PostsStateSuccess implements PostsState {}

class PostsStateFailure implements PostsState {
  late Failure error;
  PostsStateFailure({
    required this.error,
  });
}

class PostsStateLoading implements PostsState {}

class PostsStateEmpty implements PostsState {}

extension PostsStateExt on PostsState {
  when({
    Function? success,
    Function? failure,
    Function? loading,
    Function? empty,
    required Function orElse,
  }) {
    switch (runtimeType) {
      case PostsStateSuccess:
        {
          if (success != null) return success();
          return orElse();
        }
      case PostsStateFailure:
        {
          if (failure != null) return failure();
          return orElse();
        }

      case PostsStateLoading:
        {
          if (loading != null) return loading();
          return orElse();
        }
      case PostsStateEmpty:
        {
          if (empty != null) return empty();
          return orElse();
        }
      default:
        {
          return orElse();
        }
    }
  }
}
