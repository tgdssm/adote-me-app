import 'package:commons/commons.dart';
import 'package:micro_app_login/src/data/datasources/create_account/create_account_datasource.dart';
import 'package:micro_app_login/src/data/models/create_account_model.dart';

class CreateAccountDatasourceImpl implements ICreateAccountDatasource {
  final IAppHttpClientService dio;
  const CreateAccountDatasourceImpl(this.dio);
  @override
  Future<(UserModel?, BaseError?)> call(CreateAccountModel accountModel) async {
    // TODO: implement call
    throw UnimplementedError();
  }

}