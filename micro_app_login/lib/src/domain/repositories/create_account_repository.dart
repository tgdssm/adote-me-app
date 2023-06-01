import 'package:commons/commons.dart';
import 'package:micro_app_login/src/domain/entities/create_account_entity.dart';

abstract class ICreateAccountRepository {
  Future<(UserEntity?, BaseError?)> call(CreateAccountEntity accountEntity);
}