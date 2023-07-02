import 'package:commons/errors/base_error.dart';
import 'package:micro_app_register_pet/src/domain/entities/pet_data_entity.dart';
import 'package:micro_app_register_pet/src/domain/repositories/register_pet_repository.dart';
import 'package:micro_app_register_pet/src/domain/usecases/register_pet/register_pet_usecase.dart';

class RegisterPetUseCaseImpl implements IRegisterPetUseCase {
  final IRegisterPetRepository repository;
  const RegisterPetUseCaseImpl(this.repository);
  @override
  Future<(bool?, BaseError?)> call(PetDataEntity petData) async {
    return await repository(petData);
  }
}
