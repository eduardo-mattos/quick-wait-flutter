import 'package:quick_wait_android/features/news/domain/errors/errors.dart';
import 'package:quick_wait_android/features/news/domain/entities/news_article.dart';
import 'package:dartz/dartz.dart';
import 'package:quick_wait_android/features/news/domain/repositories/news_repository.dart';
import 'package:quick_wait_android/features/news/external/news_datasource_api.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDatasourceApi datasource;

  NewsRepositoryImpl(this.datasource);

  @override
  Future<Either<GetNewsError, List<NewsArticle>>> getNews() async {
    final result = await datasource.getNews();

    return Right(result);
  }
}
