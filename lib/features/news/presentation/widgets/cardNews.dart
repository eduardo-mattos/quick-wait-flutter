import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/news/domain/entities/news_article.dart';

class CardNews extends StatelessWidget {
  NewsArticle news;
  DateTime dateString;
  CardNews({Key? key, required this.news, required this.dateString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(news.title);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 109.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.5,
                height: 83,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17.0),
                  child: news.imageUrl != null
                      ? Image.network(
                          news.imageUrl ?? '',
                          width: 164,
                          height: 83,
                          fit: BoxFit.cover,
                        )
                      : Container(),
                ),
                decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(17.0)),
              ),
              Container(
                width: 180,
                height: 83,
                decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(17.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: Text(
                          news.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '${dateString.day}/${dateString.month} - '
                        '${dateString.hour}:${dateString.minute}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        heightFactor: 0.2,
                        child: TextButton(
                          onPressed: () {
                            Modular.to.pushNamed("/listNews/news", arguments: news);
                          },
                          child: const Text(
                            'Ir para noticia >',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
