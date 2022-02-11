import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:quick_wait_android/features/news/presentation/widgets/cardNews.dart';
import 'package:quick_wait_android/features/news/presentation/widgets/carouselNews.dart';

class ListNewsPage extends StatefulWidget {
  ListNewsPage() : super();
  @override
  _ListNewsPageState createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  List newsList = [];
  @override
  void initState() {
    getNews();
    super.initState();
  }

  Future getNews() async {
    var API_KEY = 'b114a79ce39e43d38fb409be42f195bb';
    var baseUrl = 'https://newsapi.org/v2/top-headlines?category=health'
    '&country=br&language=pt&apiKey=${API_KEY}';
    final uri = Uri.parse('$baseUrl');

    var response = await http.get(uri);

    var items = json.decode(response.body);

    setState(() {
      items['articles'].forEach((item) {
        newsList.add(item);
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
            Container(
                color: const Color(0xFFCDFAF5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: CarouselNews(news: newsList)
            ),
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
                      var dateString = DateTime.parse(item['publishedAt']);
                      return CardNews(news: item, dateString: dateString);
                    })),
          ],
        ),
      ),
    );
  }
}
