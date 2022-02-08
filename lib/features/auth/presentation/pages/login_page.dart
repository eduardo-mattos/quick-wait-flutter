import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:quick_wait_android/design_system/buttons/rounded_elevated_button.dart';
import 'package:quick_wait_android/design_system/inputs/generic_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage() : super();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E4FDFF"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 0),
              child: GenericInput(
                label: "Usuário",
                alignment: CrossAxisAlignment.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 0),
              child: GenericInput(
                label: "Senha",
                alignment: CrossAxisAlignment.start,
              ),
            ),
            TextButton(
              onPressed: () {
                Modular.to.pushNamed("/auth/forgotPassword");
              },
              child: const Text(
                'Esqueceu sua senha? Clique aqui',
                style: TextStyle(
                    color: Colors.blue, fontSize: 15, fontFamily: 'Quicksand'),
              ),
            ),
            Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                  color: HexColor("#E4FDFF"),
                  borderRadius: BorderRadius.circular(17)),
              child: RoundedElevatedButton(
                title: "Entrar",
                onPressed: () {
                  Modular.to.navigate("/home");
                },
              ),
            ),
            CircularButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
