import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/news/presentation/pages/listNews_page.dart';
import 'package:quick_wait_android/features/news/presentation/pages/news_page.dart';

class NewsModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ListNewsPage()),
        ChildRoute('/news', child: (context, args) => NewsPage()),
      ];
}
