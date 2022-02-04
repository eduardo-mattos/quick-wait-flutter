import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../design_system/buttons/rounded_elevated_button.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#E4FDFF"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color: Colors.blue.shade50),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 130,
                      width: 130,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: "Entrar com o google ",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onPressed: () {},
                    ),
                    SignInButton(
                      Buttons.Facebook,
                      text: "Entrar com o facebook ",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: HexColor("#ff64D3D8"),
                            thickness: 4,
                            height: 2,
                          )),
                          Container(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: const Text(
                              'OU',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: HexColor("#ff64D3D8"),
                            thickness: 4,
                            height: 2,
                          )),
                        ],
                      ),
                    ),
                    Container(
                        width: 220,
                        child: RoundedElevatedButton(
                          title: "Entrar",
                          onPressed: () {
                            HomeController().submitForm(context);
                          },
                        )),
                    Container(
                        width: 220,
                        child: RoundedElevatedButton(
                          title: "Cadastrar-se",
                          onPressed: () {
                            Modular.to.pushNamed('/auth/signup');
                          },
                        )),
                    Container(
                        width: 220,
                        child: RoundedElevatedButton(
                          title: "Convidado",
                          onPressed: () {},
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
