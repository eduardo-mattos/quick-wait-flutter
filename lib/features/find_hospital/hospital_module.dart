import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/find_hospital/presentation/pages/hospital_page.dart';


class HospitalModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
      ChildRoute('/', child: (context, args) => HospitalPage()),
  ];
}
