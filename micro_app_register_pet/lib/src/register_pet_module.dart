import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_register_pet/src/data/datasources/register_pet/register_pet_datasource.dart';
import 'package:micro_app_register_pet/src/data/datasources/register_pet/register_pet_datasource_impl.dart';
import 'package:micro_app_register_pet/src/data/repositories/register_pet_repository_impl.dart';
import 'package:micro_app_register_pet/src/domain/repositories/register_pet_repository.dart';
import 'package:micro_app_register_pet/src/domain/usecases/register_pet/register_pet_usecase.dart';
import 'package:micro_app_register_pet/src/domain/usecases/register_pet/register_pet_usecase_impl.dart';
import 'package:micro_app_register_pet/src/ui/pages/register/register_bloc.dart';
import 'package:micro_app_register_pet/src/ui/pages/register/register_page.dart';

class RegisterPetModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind> get binds => [
        // Datasources
        Bind.factory<IRegisterPetDatasource>(
          (i) => RegisterPetDatasourceImpl(i()),
        ),

        // Repositories
        Bind.factory<IRegisterPetRepository>(
          (i) => RegisterPetRepositoryImpl(i()),
        ),

        // Use cases
        Bind.factory<IRegisterPetUseCase>(
          (i) => RegisterPetUseCaseImpl(i()),
        ),

        // Blocs
        Bind.factory<RegisterBloc>(
          (i) => RegisterBloc(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.initial.path,
          child: (context, args) => const RegisterPage(),
        ),
      ];
}
