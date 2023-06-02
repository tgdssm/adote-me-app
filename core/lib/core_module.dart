import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<Dio>(
          (i) => Dio(),
          export: true,
        ),
        Bind.singleton<UserProvider>(
          (i) => UserProvider(),
          export: true,
        ),
      ];
}
