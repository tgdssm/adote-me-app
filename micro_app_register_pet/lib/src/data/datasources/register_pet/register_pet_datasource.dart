import 'package:commons/commons.dart';
import 'package:micro_app_register_pet/src/data/models/pet_data_model.dart';

abstract class IRegisterPetDatasource {
  Future<(bool?, BaseError?)> call(PetDataModel petData);
}
