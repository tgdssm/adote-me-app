import 'package:commons/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
    super.id,
    super.name,
    super.email,
    super.cellphone,
    super.createdAt,
    super.token,
  );

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    map["id"],
    map["name"],
    map["email"],
    map["cellphone"].toString(),
    DateTime.parse(map["created_at"]),
    map["token"],
  );
}
