import 'package:blocjson/modules/posts/pages/posts_event.dart';
import 'package:blocjson/modules/posts/pages/posts_state.dart';
import 'package:blocjson/modules/posts/repository/posts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Cubit<PostsState> {
  final PostsRepository repository;

  PostsBloc(
    this.repository,
  ) : super(PostsStateEmpty()) {
    getPosts();
  }

  Future<void> getPosts() async {
    emit(PostsStateLoading());
    final response = await repository.getPosts();
    response.fold((l) => emit(PostsStateFailure(error: l)),
        (r) => emit(PostsStateSuccess(listPost: r.data)));
  }
}
