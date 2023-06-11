import 'package:commons/commons.dart';

class UserProvider {
  static final UserProvider _singleton = UserProvider._internal();
  UserProvider._internal();
  factory UserProvider() => _singleton;

  UserEntity? _user;

  UserEntity get userData => _user!;

  set userData(UserEntity user) {
    _user = user;
  }

  bool get hasUser => _user != null;
}
