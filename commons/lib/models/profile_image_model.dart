import 'package:commons/entities/profile_image_entity.dart';

class ProfileImageModel extends ProfileImageEntity {
  ProfileImageModel(
    super.id,
    super.fileName,
    super.filePath,
    super.userId,
  );

  factory ProfileImageModel.fromMap(Map<String, dynamic> map) =>
      ProfileImageModel(
        map["id"],
        map["fileName"],
        map["filePath"],
        map["userId"],
      );
}
