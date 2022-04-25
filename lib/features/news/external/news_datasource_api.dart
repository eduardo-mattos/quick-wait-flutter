import 'package:dio/dio.dart';
import 'package:quick_wait_android/features/news/data/datasources/news_datasource.dart';
import 'package:quick_wait_android/features/news/data/dtos/news_article_dto.dart';
import 'package:quick_wait_android/features/news/domain/errors/errors.dart';

class NewsDatasourceApi implements NewsDatasource {
  final Dio dio;

  NewsDatasourceApi(this.dio);

  @override
  Future<List<NewsArticleDto>> getNews() async {
    var API_KEY = 'b114a79ce39e43d38fb409be42f195bb';
    var baseUrl = 'https://newsapi.org/v2/top-headlines?category=health'
        '&country=br&language=pt&apiKey=${API_KEY}';
    // final uri = Uri.parse('$baseUrl');
    var response = await dio.get(baseUrl.toString());

    if (response.statusCode == 200) {
      var items = (response.data['articles'] as List).map((element) => NewsArticleDto.fromJson(element)).toList();
      return items;
    } else {
      throw GetNewsNotFoundError();
    }
  }
}
