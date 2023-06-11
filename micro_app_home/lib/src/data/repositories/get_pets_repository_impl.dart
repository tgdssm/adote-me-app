import 'package:commons/entities/pet_entity.dart';
import 'package:commons/errors/base_error.dart';
import 'package:micro_app_home/src/data/datasources/get_pets/get_pets_datasource.dart';
import 'package:micro_app_home/src/domain/repositories/get_pets_repository.dart';

class GetPetRepositoryImpl implements IGetPetRepository {
  final IGetPetsDatasource datasource;
  const GetPetRepositoryImpl(this.datasource);
  @override
  Future<(List<PetEntity>?, BaseError?)> call() async {
    final (result, err) = await datasource();
    if (err != null) {
      return (null, err);
    }
    return (result, null);
  }
}
