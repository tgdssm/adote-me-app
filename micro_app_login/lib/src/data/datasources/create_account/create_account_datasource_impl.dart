import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_login/src/data/datasources/create_account/create_account_datasource.dart';
import 'package:micro_app_login/src/data/models/create_account_model.dart';

class CreateAccountDatasourceImpl implements ICreateAccountDatasource {
  final Dio dio;
  const CreateAccountDatasourceImpl(this.dio);
  @override
  Future<(UserModel?, BaseError?)> call(CreateAccountModel accountModel) async {
    try {
      final result = await dio.post(
        "http://10.0.2.2:8080/users",
        data: accountModel.toMap(),
      );
      final user = UserModel.fromMap(result.data);
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] = user.token;
        },
      ));
      return(user, null);
    } on DioError catch (e) {
      return (null, BaseError(e.message ?? e.toString()));
    } catch (e) {
      return (null, BaseError(e.toString()));
    }
  }
}
