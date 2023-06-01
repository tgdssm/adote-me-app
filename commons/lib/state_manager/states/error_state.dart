import 'package:commons/state_manager/states/base_state.dart';

class ErrorState extends BaseState {
  final String message;

  ErrorState(this.message);
}