import 'package:commons/errors/base_error.dart';
import 'package:commons/models/user_model.dart';
import 'package:micro_app_login/src/data/datasources/login/login_datasource.dart';
import 'package:micro_app_login/src/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDatasource datasource;
  const LoginRepositoryImpl(this.datasource);
  @override
  Future<(UserModel?, BaseError?)> call(
    String email,
    String password,
  ) async {
    final (result, err) = await datasource(
      email,
      password,
    );

    if(err != null) {
      return (null, err);
    }

    return (result, null);
  }
}
