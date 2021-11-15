import 'package:blocjson/modules/posts/repository/posts_repository.dart';

class PostsBloc {
  final PostsRepository repository;
  PostsBloc({
    required this.repository,
  });
}
