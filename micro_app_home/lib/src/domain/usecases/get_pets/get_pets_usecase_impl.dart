import 'package:commons/entities/pet_entity.dart';
import 'package:commons/errors/base_error.dart';
import 'package:micro_app_home/src/domain/repositories/get_pets_repository.dart';
import 'package:micro_app_home/src/domain/usecases/get_pets/get_pets_usecase.dart';

class GetPetsUseCaseImpl implements IGetPetsUseCase {
  final IGetPetRepository repository;
  const GetPetsUseCaseImpl(this.repository);
  @override
  Future<(List<PetEntity>?, BaseError?)> call() async {
    return await repository();
  }

}