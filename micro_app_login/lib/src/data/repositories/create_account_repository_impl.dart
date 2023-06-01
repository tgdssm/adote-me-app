import 'package:commons/entities/user_entity.dart';

import 'package:commons/errors/base_error.dart';
import 'package:micro_app_login/src/data/datasources/create_account/create_account_datasource.dart';

import 'package:micro_app_login/src/domain/entities/create_account_entity.dart';

import '../../domain/repositories/create_account_repository.dart';

class CreateAccountRepositoryImpl implements ICreateAccountRepository {
  final ICreateAccountDatasource datasource;
  const CreateAccountRepositoryImpl(this.datasource);

  @override
  Future<(UserEntity?, BaseError?)> call(CreateAccountEntity accountEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }

}