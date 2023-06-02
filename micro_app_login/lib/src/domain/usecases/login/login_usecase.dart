import 'package:commons/commons.dart';

abstract class ILoginUseCase {
  Future<(UserModel?, BaseError?)> call(String email, String password);
}