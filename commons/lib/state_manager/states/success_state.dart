import 'package:commons/state_manager/states/base_state.dart';

class SuccessState<T> extends BaseState {
  final T data;

  SuccessState(this.data);
}