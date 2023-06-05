import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'ui/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Routes.initial.path,
      child: (context, args) => const HomePage(),
    ),
  ];
}