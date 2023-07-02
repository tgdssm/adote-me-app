import 'package:commons/errors/base_error.dart';
import 'package:micro_app_register_pet/src/data/datasources/register_pet/register_pet_datasource.dart';
import 'package:micro_app_register_pet/src/data/models/pet_data_model.dart';
import 'package:micro_app_register_pet/src/domain/entities/pet_data_entity.dart';
import 'package:micro_app_register_pet/src/domain/repositories/register_pet_repository.dart';

class RegisterPetRepositoryImpl implements IRegisterPetRepository {
  final IRegisterPetDatasource datasource;
  const RegisterPetRepositoryImpl(this.datasource);
  @override
  Future<(bool?, BaseError?)> call(PetDataEntity petData) async {
    final (result, err) = await datasource(PetDataModel.fromEntity(petData));
    if (err != null) {
      return (null, err);
    }

    return (result, err);
  }
}
