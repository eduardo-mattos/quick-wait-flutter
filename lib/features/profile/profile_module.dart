import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/profile/presentation/pages/profile_page.dart';

class ProfuleModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ProfilePage()),
      ];
}
