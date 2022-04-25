import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:quick_wait_android/features/news/data/repositories/news_repository_impl.dart';
import 'package:quick_wait_android/features/news/domain/usecases/get_news.dart';
import 'package:quick_wait_android/features/news/external/news_datasource_api.dart';
import 'package:quick_wait_android/features/news/presentation/pages/listNews_page.dart';
import 'package:quick_wait_android/features/news/presentation/pages/news_page.dart';

class NewsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => Dio()),
        Bind((i) => NewsDatasourceApi(i())),
        Bind((i) => NewsRepositoryImpl(i())),
        Bind((i) => GetNewsImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ListNewsPage()),
        ChildRoute('/news', child: (context, args) => NewsPage()),
      ];
}
