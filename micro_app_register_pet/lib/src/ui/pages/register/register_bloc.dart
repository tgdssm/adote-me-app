import 'dart:async';

import 'package:commons/commons.dart';
import 'package:micro_app_register_pet/src/domain/entities/pet_data_entity.dart';
import 'package:micro_app_register_pet/src/domain/usecases/register_pet/register_pet_usecase.dart';

class RegisterBloc {
  final IRegisterPetUseCase useCase;
  RegisterBloc(this.useCase);

  final _outputState = StreamController<BaseState>();

  Stream<BaseState> get stream => _outputState.stream;

  Future<void> call(PetDataEntity petData) async {
    _outputState.add(LoadingState());
    final (result, err) = await useCase(petData);
    print(result);
    if (err != null) {
      print(err.message);
      _outputState.add(ErrorState(err.message));
      return;
    }

    _outputState.add(SuccessState(result));
  }
}
