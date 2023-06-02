import 'package:commons/errors/base_error.dart';
import 'package:commons/models/user_model.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_login/src/data/datasources/login/login_datasource.dart';

class LoginDatasourceImpl implements ILoginDatasource {
  final Dio dio;
  const LoginDatasourceImpl(this.dio);
  @override
  Future<(UserModel?, BaseError?)> call(String email, String password) async {
    try {
      final result = await dio.post(
        "http://10.0.2.2:8080/login",
        data: {
          "email": email,
          "passwd": password,
        },
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