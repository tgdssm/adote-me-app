import 'package:commons/commons.dart';

abstract class ILoginRepository {
  Future<(UserModel?, BaseError?)> call(String email, String password);
}