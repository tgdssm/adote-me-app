import 'package:commons/commons.dart';

abstract class IGetPetsDatasource {
  Future<(List<PetModel>?, BaseError?)> call();
}