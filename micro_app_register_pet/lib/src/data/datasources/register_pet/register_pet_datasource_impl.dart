import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:micro_app_register_pet/src/data/datasources/register_pet/register_pet_datasource.dart';
import 'package:micro_app_register_pet/src/data/models/pet_data_model.dart';

class RegisterPetDatasourceImpl implements IRegisterPetDatasource {
  final IAppHttpClientService dio;
  const RegisterPetDatasourceImpl(this.dio);
  @override
  Future<(bool?, BaseError?)> call(PetDataModel petData) async {
    try {
      final formData = FormData.fromMap({
        'pet_name': petData.name,
        'age': petData.age,
        'weight': petData.weight,
        'user_id': petData.userId,
        'requirements': petData.requirements,
        'photo': petData.photos
            .map(
              (file) => MultipartFile.fromBytes(
                file.readAsBytesSync(),
                filename: file.path.split('/').last,
              ),
            )
            .toList(),
      });
      final result = await dio.post(
        'http://10.0.2.2:3000/pets',
        formData: formData,
        contentType: 'multipart/form-data',
      );
      print(result.data);
      return (true, null);
    } on DioError catch (e) {
      return (null, BaseError(e.message ?? e.toString()));
    } catch (e) {
      return (null, BaseError(e.toString()));
    }
  }
}
