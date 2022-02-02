import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/find_hospital/hospital_module.dart';

import 'features/auth/auth_module.dart';
import 'features/home/home_module.dart';
import 'pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/hospital', module: HospitalModule()),
        ChildRoute('/', child: (context, args) => const SplashPage()),
      ];
}
