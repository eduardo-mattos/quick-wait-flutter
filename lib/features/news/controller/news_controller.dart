import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/news/data/repositories/news_repository_impl.dart';
import 'package:quick_wait_android/features/news/domain/usecases/get_news.dart';

class NewsController {
  getNews() async {
    final usecase = Modular.get<GetNewsImpl>();
    final news = await usecase();

    return news;
  }
}
