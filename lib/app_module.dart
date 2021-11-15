import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/posts/posts_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => AppController(),
        ),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
        ModuleRoute(
          "/posts",
          module: PostsModule(),
        ),
      ];
}
