import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:quick_wait_android/features/profile/presentation/widgets/ProfileBackground.dart';

class NewsHeader extends StatelessWidget {
  dynamic news;
  NewsHeader({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFCDFAF5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ProfileBackground(
                imageUrl: news['urlToImage'],
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      news['title'],
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
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
