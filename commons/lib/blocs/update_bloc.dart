import 'dart:async';

class UpdateBloc<T> {
  final _outputState = StreamController<T>();
  Stream<T> get stream => _outputState.stream;

  Future<void> call(T update) async {
    _outputState.add(update);
  }
}