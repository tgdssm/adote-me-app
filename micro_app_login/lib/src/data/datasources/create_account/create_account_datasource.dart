import 'package:commons/commons.dart';
import 'package:micro_app_login/src/data/models/create_account_model.dart';

abstract class ICreateAccountDatasource {
  Future<(UserModel?, BaseError?)> call(CreateAccountModel accountModel);
}