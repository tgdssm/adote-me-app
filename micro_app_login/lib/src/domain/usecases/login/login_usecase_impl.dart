import 'package:commons/errors/base_error.dart';
import 'package:commons/models/user_model.dart';
import 'package:micro_app_login/src/domain/repositories/login_repository.dart';
import 'package:micro_app_login/src/domain/usecases/login/login_usecase.dart';

class LoginUseCaseImpl implements ILoginUseCase {
  final ILoginRepository repository;
  const LoginUseCaseImpl(this.repository);

  @override
  Future<(UserModel?, BaseError?)> call(String email, String password) async {
    return repository(email, password);
  }

}