import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Routes.initial.path, module: LoginModule()),
        ModuleRoute(Routes.home.path, module: HomeModule()),
        ModuleRoute(Routes.register.path, module: RegisterPetModule()),
      ];
}
