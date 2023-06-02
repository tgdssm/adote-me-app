import 'package:commons/commons.dart';

abstract class ILoginDatasource {
  Future<(UserModel?, BaseError?)> call(String email, String password);
}