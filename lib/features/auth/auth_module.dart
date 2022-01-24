import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/auth/presentation/pages/home_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => super.binds;

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage())
  ];
}