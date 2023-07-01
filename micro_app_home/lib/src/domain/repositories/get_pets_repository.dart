import 'package:commons/commons.dart';

abstract class IGetPetRepository {
  Future<(List<PetEntity>?, BaseError?)> call();
}