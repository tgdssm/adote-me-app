import 'package:commons/commons.dart';

import 'package:dependencies/dependencies.dart';
import 'package:micro_app_login/src/data/datasources/login/login_datasource.dart';

class LoginDatasourceImpl implements ILoginDatasource {
  final IAppHttpClientService dio;
  const LoginDatasourceImpl(this.dio);
  @override
  Future<(UserModel?, BaseError?)> call(String email, String password) async {
    try {
      final result = await dio.post(
        "http://10.0.2.2:3000/login",
        {
          "email": email,
          "passwd": password,
        },
      );
      final user = UserModel.fromMap(result.data);
      return (user, null);
    } on DioError catch (e) {
      return (null, BaseError(e.message ?? e.toString()));
    } catch (e) {
      return (null, BaseError(e.toString()));
    }
  }
}
