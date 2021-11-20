import 'package:blocjson/modules/home/pages/home_bloc.dart';
import 'package:blocjson/modules/home/pages/local_auth_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton(
          (i) => HomeBloc(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const HomePage(),
        ),
        ChildRoute(
          "/local_auth",
          child: (_, args) => LocalAuthPage(),
        ),
      ];
}
