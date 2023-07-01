import 'package:commons/entities/pet_entity.dart';
import 'package:commons/errors/base_error.dart';

abstract class IGetPetsUseCase {
  Future<(List<PetEntity>?, BaseError?)> call();
}