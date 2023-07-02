import 'package:commons/errors/base_error.dart';
import 'package:micro_app_register_pet/src/domain/entities/pet_data_entity.dart';

abstract class IRegisterPetRepository {
  Future<(bool?, BaseError?)> call(PetDataEntity petData);

}