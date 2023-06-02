import 'dart:async';

import 'package:commons/commons.dart';
import 'package:micro_app_login/src/domain/usecases/login/login_usecase.dart';

class LoginBloc {
  final ILoginUseCase useCase;
  LoginBloc(this.useCase);

  final StreamController<BaseState> _outputState = StreamController<BaseState>();

  Stream<BaseState> get stream => _outputState.stream;

  Future<void> call(String email, String password) async {
    _outputState.add(LoadingState());
    final (result, err) = await useCase(email, password);
    if(err != null) {
      _outputState.add(ErrorState(err.message));
      return;
    }

    _outputState.add(SuccessState(result!));
    return;
  }
}