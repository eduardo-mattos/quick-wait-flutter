import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/config_page.dart';

class ConfigModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ConfigPage()),
      ];
}
