import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:quick_wait_android/design_system/buttons/rounded_elevated_button.dart';
import 'package:quick_wait_android/design_system/inputs/generic_input.dart';
import 'package:quick_wait_android/features/auth/presentation/controllers/login_controller.dart';

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
        child: Form(
          key: LoginController().formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Center(
                  child: Container(width: 200, height: 150, child: Image.asset('assets/images/logo.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Usuário',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF12A1A7), fontSize: 20, fontFamily: 'Quicksand'),
                        ),
                      ),
                      Material(
                        elevation: 4.0,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(17),
                        child: TextFormField(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          initialValue: LoginController().formData.name,
                          onSaved: (String? value) {
                            LoginController().formData.name = value.toString();
                          },
                          style: const TextStyle(height: 0.6),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 0.2),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Senha',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF12A1A7), fontSize: 20, fontFamily: 'Quicksand'),
                            ),
                          ),
                          Material(
                            elevation: 4.0,
                            shadowColor: Colors.grey,
                            borderRadius: BorderRadius.circular(17),
                            child: TextFormField(
                              onChanged: (text) {},
                              obscureText: true,
                              initialValue: LoginController().formData.password,
                              onSaved: (String? value) {
                                LoginController().formData.password = value.toString();
                              },
                              style: const TextStyle(height: 0.6),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 0.2),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))),
              TextButton(
                onPressed: () {
                  Modular.to.pushNamed("/auth/forgotPassword");
                },
                child: const Text(
                  'Esqueceu sua senha? Clique aqui',
                  style: TextStyle(color: Colors.blue, fontSize: 15, fontFamily: 'Quicksand'),
                ),
              ),
              Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                child: RoundedElevatedButton(
                  title: "Entrar",
                  onPressed: () {
                    // Modular.to.navigate("/home");
                    LoginController().submitForm(context);
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
      ),
    );
  }
}
