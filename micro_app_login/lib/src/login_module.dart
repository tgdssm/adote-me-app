import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_login/src/data/datasources/create_account/create_account_datasource_impl.dart';
import 'package:micro_app_login/src/data/repositories/create_account_repository_impl.dart';
import 'package:micro_app_login/src/domain/repositories/create_account_repository.dart';
import 'package:micro_app_login/src/domain/usecases/create_account/create_account_usecase.dart';
import 'package:micro_app_login/src/domain/usecases/create_account/create_account_usecase_impl.dart';
import 'package:micro_app_login/src/ui/pages/create_account/create_account_bloc.dart';
import 'package:micro_app_login/src/ui/pages/create_account/create_account_page.dart';
import 'data/datasources/create_account/create_account_datasource.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind> get binds => [
    // Datasources
    Bind.factory<ICreateAccountDatasource>((i) => CreateAccountDatasourceImpl(i())),


    // Repositories
    Bind.factory<ICreateAccountRepository>((i) => CreateAccountRepositoryImpl(i())),


    // Use Cases
    Bind.factory<ICreateAccountUseCase>((i) => CreateAccountUseCaseImpl(i())),


    // Blocs
    Bind.factory<CreateAccountBloc>((i) => CreateAccountBloc(i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.initial.path,
          child: (context, args) => const CreateAccountPage(),
        ),
      ];
}
