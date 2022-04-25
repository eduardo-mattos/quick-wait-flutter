import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:quick_wait_android/features/profile/presentation/widgets/ProfileBackground.dart';

import '../../domain/entities/news_article.dart';

class CarouselNews extends StatelessWidget {
  List<NewsArticle> news;
  CarouselNews({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFCDFAF5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 3,
                enlargeCenterPage: true,
                viewportFraction: 1.1,
                aspectRatio: 2.0,
                autoPlay: true,
              ),
              items: news.take(5).map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ProfileBackground(
                        imageUrl: i.imageUrl,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              i.title.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: CircularButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ),
          ],
        ));
  }
}
