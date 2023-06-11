import 'dart:async';

import 'package:commons/commons.dart';
import 'package:micro_app_home/src/domain/usecases/get_pets/get_pets_usecase.dart';

class HomeBloc {
  final IGetPetsUseCase useCase;
  HomeBloc(this.useCase);

  final _outputState = StreamController<BaseState>();
  Stream<BaseState> get stream => _outputState.stream;

  Future<void> call() async {
    _outputState.add(LoadingState());
    final (result, err) = await useCase();
    if(err != null) {
      print(err.message);
      _outputState.add(ErrorState(err.message));
      return;
    }

    _outputState.add(SuccessState<List<PetEntity>>(result!));
    return;
  }
}