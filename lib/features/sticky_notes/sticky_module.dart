import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/sticky_notes/presentation/pages/sticky_notes_page.dart';

class StickyModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => StickyNotesPage()),
      ];
}
