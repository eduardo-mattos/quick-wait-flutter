import 'package:quick_wait_android/features/news/data/dtos/news_article_dto.dart';

abstract class NewsDatasource {
  Future<List<NewsArticleDto>> getNews();
}
