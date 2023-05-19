import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import 'presenter/splash_screen.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.initial.path,
          child: (context, args) => const SplashScreen(),
        )
      ];
}
