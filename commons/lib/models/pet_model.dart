import 'package:commons/entities/pet_entity.dart';
import 'package:commons/models/user_model.dart';

class PetModel extends PetEntity {
  PetModel(
    super.id,
    super.name,
    super.age,
    super.weight,
    super.requirements,
    super.createdAt,
    super.user,
    super.photos,
  );

  factory PetModel.fromMap(Map<String, dynamic> map) => PetModel(
        map["id"],
        map["name"],
        map["age"],
        map["weight"].toDouble(),
        map["requirements"],
        DateTime.parse(map["created_at"]),
        UserModel.fromMap(map["user"]),
        List<String>.from(map["photos"]
            .map((photo) => "http://10.0.2.2:3000/${photo["file_path"]}")),
      );
}
