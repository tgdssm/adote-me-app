import 'package:dependencies/dependencies.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => Dio(), export: true)];
}
