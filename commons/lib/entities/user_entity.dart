import 'package:commons/entities/profile_image_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String cellphone;
  ProfileImageEntity? profileImage;
  final DateTime createdAt;
  final String token;

  UserEntity(
    this.id,
    this.name,
    this.cellphone,
    this.profileImage,
    this.createdAt,
    this.token,
  );
}
