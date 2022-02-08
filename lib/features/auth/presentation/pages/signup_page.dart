import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:quick_wait_android/design_system/inputs/generic_input.dart';
import 'package:quick_wait_android/features/auth/presentation/widgets/signup_body.dart';
import 'package:quick_wait_android/features/auth/presentation/widgets/signup_header.dart';

class SignupPage extends StatefulWidget {
  SignupPage() : super();

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E4FDFF"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SignupHeader(),
            SignupBody(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    GenericInput(
                      label: 'Nome',
                      alignment: CrossAxisAlignment.center,  
                    ),
                    GenericInput(
                      label: 'Data de Nascimento',
                      alignment: CrossAxisAlignment.center,
                    ),
                    GenericInput(
                      label: 'Celular',
                      alignment: CrossAxisAlignment.center,  
                    ),
                    GenericInput(
                      label: 'E-mail',
                      alignment: CrossAxisAlignment.center,
                    ),
                    GenericInput(
                      label: 'CPF (Opicional)',
                      alignment: CrossAxisAlignment.center,  
                    ),
                    GenericInput(
                      label: 'Senha',
                      alignment: CrossAxisAlignment.center,  
                    ),
                    GenericInput(
                      label: 'Confirmar Senha',
                      alignment: CrossAxisAlignment.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircularButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded),
                          onPressed: () {
                            Modular.to.pop();
                          },
                        ),
                        CircularButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          onPressed: () {
                            Modular.to.pop();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
