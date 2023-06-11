import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_home/src/data/datasources/get_pets/get_pets_datasource.dart';
import 'package:micro_app_home/src/data/datasources/get_pets/get_pets_datasource_impl.dart';
import 'package:micro_app_home/src/data/repositories/get_pets_repository_impl.dart';
import 'package:micro_app_home/src/domain/repositories/get_pets_repository.dart';
import 'package:micro_app_home/src/domain/usecases/get_pets/get_pets_usecase.dart';
import 'package:micro_app_home/src/domain/usecases/get_pets/get_pets_usecase_impl.dart';
import 'package:micro_app_home/src/ui/pages/home/home_bloc.dart';
import 'ui/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind> get binds => [
    // Datasources
    Bind.factory<IGetPetsDatasource>((i) => GetPetsDatasourceImpl(i()),),

    // Repositories
    Bind.factory<IGetPetRepository>((i) => GetPetRepositoryImpl(i()),),

    // Usecases
    Bind.factory<IGetPetsUseCase>((i) => GetPetsUseCaseImpl(i()),),

    // Blocs
    Bind.factory<HomeBloc>((i) => HomeBloc(i()))

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Routes.initial.path,
      child: (context, args) => const HomePage(),
    ),
  ];
}