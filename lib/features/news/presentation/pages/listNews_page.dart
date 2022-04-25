import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:quick_wait_android/features/news/controller/news_controller.dart';
import 'package:quick_wait_android/features/news/domain/entities/news_article.dart';
import 'package:quick_wait_android/features/news/presentation/widgets/cardNews.dart';
import 'package:quick_wait_android/features/news/presentation/widgets/carouselNews.dart';

class ListNewsPage extends StatefulWidget {
  ListNewsPage() : super();
  @override
  _ListNewsPageState createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  List<NewsArticle> newsList = [];

  final controller = NewsController();

  @override
  void initState() {
    populateNewsList();
    super.initState();
  }

  populateNewsList() async {
    final news = await controller.getNews();
    setState(() {
      news.fold((l) => null, (r) {
        newsList = r;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E4FDFF"),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(color: const Color(0xFFCDFAF5), width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height / 3, child: CarouselNews(news: newsList)),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final item = newsList[index];
                  var dateString = DateTime.now();
                  return CardNews(news: item, dateString: dateString);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
