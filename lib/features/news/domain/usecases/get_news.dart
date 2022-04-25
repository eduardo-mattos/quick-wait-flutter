import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quick_wait_android/features/news/domain/entities/news_article.dart';
import 'package:quick_wait_android/features/news/domain/errors/errors.dart';
import 'package:http/http.dart' as http;
import 'package:quick_wait_android/features/news/domain/repositories/news_repository.dart';

abstract class GetNews {
  Future<Either<GetNewsError, List<NewsArticle>>> call();
}

class GetNewsImpl implements GetNews {
  final NewsRepository repository;

  GetNewsImpl(this.repository);

  @override
  Future<Either<GetNewsError, List<NewsArticle>>> call() async {
    final news = await repository.getNews();
    return news;
  }
}
