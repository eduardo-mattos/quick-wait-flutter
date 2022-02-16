import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/features/home/presentation/controllers/home_menu_controller.dart';

import '../../../../design_system/buttons/rounded_elevated_button.dart';
import '../widgets/home_header.dart';
import '../widgets/home_large_button.dart';

class HomeMenuPage extends StatefulWidget {
  HomeMenuPage() : super();

  @override
  _HomeMenuPageState createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  // const HomeMenuPage({Key? key}) : super(key: key);
  final double _buttonHeight = 90;
  final double _buttonsSpacing = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#12A1A7").withOpacity(0.5),
        elevation: 0,
        toolbarHeight: 10,
      ),
      backgroundColor: HexColor("#E4FDFF"),
      body: Column(
        children: [
          const HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  HomeLargeButton(
                    height: _buttonHeight,
                    onPressed: () {
                      HomeMenuController().submitForm(context);
                    },
                    title: "HOSPITAIS",
                    icon: Image.asset(
                      "assets/icons/find_hospitals.png",
                    ),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  HomeLargeButton(
                    height: _buttonHeight,
                    onPressed: () => { Modular.to.pushNamed('/stick')},
                    title: "LEMBRETES",
                    icon: Image.asset(
                      "assets/icons/medicine.png",
                    ),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  HomeLargeButton(
                    height: _buttonHeight,
                    onPressed: () => { Modular.to.pushNamed('/listNews') },
                    title: "NOTÍCIAS",
                    icon: Image.asset(
                      "assets/icons/news.png",
                    ),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  HomeLargeButton(
                    height: _buttonHeight,
                    title: "CONFIGURAÇÕES",
                    icon: Image.asset(
                      "assets/icons/settings.png",
                    ),
                    onPressed: () => Modular.to.navigate('/config'),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  SizedBox(
                    width: 200,
                    child: RoundedElevatedButton(
                      onPressed: () => Modular.to.navigate('/auth'),
                      title: "SAIR",
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
