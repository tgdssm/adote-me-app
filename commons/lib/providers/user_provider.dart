import 'package:commons/commons.dart';

class UserProvider {
  UserEntity? _user;

  UserEntity get userData => _user!;

  set userData(UserEntity user) {
    _user = user;
  }
}