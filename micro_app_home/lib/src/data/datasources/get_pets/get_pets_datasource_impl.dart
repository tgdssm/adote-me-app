import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_home/src/data/datasources/get_pets/get_pets_datasource.dart';

class GetPetsDatasourceImpl implements IGetPetsDatasource {
  final IAppHttpClientService dio;
  const GetPetsDatasourceImpl(this.dio);
  @override
  Future<(List<PetModel>?, BaseError?)> call() async {
    try {
      final users = <PetModel>[];
      final result = await dio.get(
        "http://10.0.2.2:3000/pets",
      );

      for(var pet in result.data) {
        users.add(PetModel.fromMap(pet as Map<String, dynamic>));
      }

      return(users, null);
    } on DioError catch (e) {
      return (null, BaseError(e.message ?? e.toString()));
    } catch (e) {
      return (null, BaseError(e.toString()));
    }
  }

}