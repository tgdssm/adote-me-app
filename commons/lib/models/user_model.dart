import 'package:commons/entities/user_entity.dart';
import 'package:commons/models/profile_image_model.dart';

class UserModel extends UserEntity {
  UserModel(
    super.id,
    super.name,
    super.cellphone,
    super.profileImage,
    super.createdAt,
    super.token,
  );

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        map["id"],
        map["name"],
        map["cellphone"],
        ProfileImageModel.fromMap(map["profileImage"]),
        map["createdAt"],
        map["token"],
      );
}
