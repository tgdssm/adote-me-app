import 'dart:async';

import 'package:commons/state_manager/states/base_state.dart';
import 'package:commons/state_manager/states/error_state.dart';
import 'package:commons/state_manager/states/loading_state.dart';
import 'package:commons/state_manager/states/success_state.dart';
import 'package:micro_app_login/src/domain/entities/create_account_entity.dart';
import 'package:micro_app_login/src/domain/usecases/create_account/create_account_usecase.dart';

class CreateAccountBloc {
  final ICreateAccountUseCase useCase;
  CreateAccountBloc(this.useCase);

  final StreamController<BaseState> _outputState = StreamController<BaseState>();

  Stream<BaseState> get stream => _outputState.stream;

  Future<void> call(CreateAccountEntity accountEntity) async {
    _outputState.add(LoadingState());

    final (result, err) = await useCase(accountEntity);
    if (err != null) {
      _outputState.add(ErrorState(err.message));
      return;
    }

    _outputState.add(SuccessState(result));
    return;

  }
}