import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/features/news/presentation/widgets/newsHeader.dart';

class NewsPage extends StatelessWidget {

  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: HexColor("#E4FDFF"),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
                color: const Color(0xFFCDFAF5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: NewsHeader(news: args)),
            Container()
          ],
        ),
      ),
    );
  }
}
