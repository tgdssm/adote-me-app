import 'package:commons/entities/user_entity.dart';
import 'package:commons/errors/base_error.dart';
import 'package:micro_app_login/src/domain/entities/create_account_entity.dart';
import 'package:micro_app_login/src/domain/repositories/create_account_repository.dart';
import 'package:micro_app_login/src/domain/usecases/create_account/create_account_usecase.dart';

class CreateAccountUseCaseImpl implements ICreateAccountUseCase {
  final ICreateAccountRepository repository;
  const CreateAccountUseCaseImpl(this.repository);
  @override
  Future<(UserEntity?, BaseError?)> call(CreateAccountEntity accountEntity) {
    return repository(accountEntity);
  }

}