import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/auth/presentation/pages/login_page.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_use_cases.dart';
import 'presentation/pages/home_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl()),
        Bind.lazySingleton<LoginUseCase>((i) => LoginUseCaseImpl(i()))
      ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage()),
    ChildRoute('/login', child: (context, args) => LoginPage()),
  ];
}
