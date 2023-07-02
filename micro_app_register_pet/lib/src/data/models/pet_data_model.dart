import 'package:micro_app_register_pet/src/domain/entities/pet_data_entity.dart';

class PetDataModel extends PetDataEntity {
  PetDataModel(
    super.name,
    super.age,
    super.weight,
    super.userId,
    super.requirements,
    super.photos,
  );

  factory PetDataModel.fromEntity(PetDataEntity petData) => PetDataModel(
        petData.name,
        petData.age,
        petData.weight,
        petData.userId,
        petData.requirements,
        petData.photos,
      );
}
