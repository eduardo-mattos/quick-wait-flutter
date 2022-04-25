import 'package:quick_wait_android/features/news/domain/entities/news_article.dart';

class NewsArticleDto extends NewsArticle {
  NewsArticleDto({required publishedAt, required imageUrl, required title}) : super(publishedAt: publishedAt, imageUrl: imageUrl, title: title);

  factory NewsArticleDto.fromJson(Map<String, dynamic> json) {
    final article = NewsArticleDto(
      imageUrl: json['urlToImage'],
      publishedAt: json['publishedAt'],
      title: json['title'],
    );

    return article;
  }
}
