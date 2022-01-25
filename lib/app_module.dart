import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth_module.dart';
import 'pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/auth', module: AuthModule()),
        ChildRoute('/', child: (context, args) => const SplashPage()),
      ];
}
