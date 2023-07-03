import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_view_pet/src/ui/pages/view_pet/view_pet_page.dart';

class ViewPetModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Routes.initial.path, child: (context, args) => ViewPetPage(pet: args.data,)),
  ];
}