import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<Dio>(
          (i) => Dio(),
          export: true,
        ),
        Bind.factory<IAppHttpClientService>(
          (i) => AppHttpClientDioServiceImpl(i()),
          export: true,
        )
      ];
}
