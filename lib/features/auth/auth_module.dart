import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/home_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [ChildRoute('/', child: (context, args) => HomePage())];
}
