import 'package:blocjson/app_controller.dart';
import 'package:blocjson/modules/posts/pages/posts_bloc.dart';
import 'package:blocjson/modules/posts/repository/posts_repository.dart';
import 'package:blocjson/modules/posts/repository/posts_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/posts_page.dart';

class PostsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => PostsRepositoryImplements(dio: i.get<AppController>().dio),
        ),
        Bind.lazySingleton(
          (i) => PostsBloc(
            repository: i.get<PostsRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const PostsPage(),
        ),
      ];
}
