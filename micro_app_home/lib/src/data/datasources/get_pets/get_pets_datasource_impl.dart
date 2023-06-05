import 'package:commons/errors/base_error.dart';
import 'package:commons/models/pet_model.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_home/src/data/datasources/get_pets/get_pets_datasource.dart';

class GetPetsDatasourceImpl implements IGetPetsDatasource {
  final Dio dio;
  const GetPetsDatasourceImpl(this.dio);
  @override
  Future<(List<PetModel>?, BaseError?)> call() {
    // TODO: implement call
    throw UnimplementedError();
  }

}