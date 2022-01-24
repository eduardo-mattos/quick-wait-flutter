import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/auth/auth_module.dart';
import 'package:quick_wait_android/pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => super.binds;

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/auth', module: AuthModule()),
    ChildRoute('/', child: (context, args) => SplashPage())
  ];
}