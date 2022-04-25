import 'package:dartz/dartz.dart';
import 'package:quick_wait_android/features/news/domain/errors/errors.dart';

import '../entities/news_article.dart';

abstract class NewsRepository {
  Future<Either<GetNewsError, List<NewsArticle>>> getNews();
}
