abstract class PostsEvent {}

class PostsFetchList implements PostsEvent {}

class PostsFetchListWithError implements PostsEvent {}

class PostsFetchListWithEmptyList implements PostsEvent {}
