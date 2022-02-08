import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/design_system/buttons/rounded_elevated_button.dart';
import 'package:quick_wait_android/design_system/inputs/generic_input.dart';

class ForgotPasswordLowerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFCDFAF5),
      height: MediaQuery.of(context).size.height / 1.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 20, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 36.0),
                  child: Text(
                    'ESQUECEU A SUA SENHA?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF12A1A7),
                        fontSize: 28,
                        fontFamily: 'Quicksand'),
                  ),
                ),
                const Text(
                  'Digite seu email abaixo e lhe enviaremos um código de verificação.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF12A1A7),
                      fontSize: 18,
                      fontFamily: 'Quicksand'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: GenericInput(
                    label: '',
                    alignment: CrossAxisAlignment.start
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RoundedElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/auth/changePassword');
                },
                title: 'Próximo'),
          ),
          Container(
            width: 345,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Confira o código de verificação em sua caixa de entrada.'
                'Ele pode estar na pasta de lixo eletrônico',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black, fontSize: 15, fontFamily: 'Quicksand'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
