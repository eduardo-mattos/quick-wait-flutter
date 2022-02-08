import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/design_system/buttons/rounded_elevated_button.dart';
import 'package:quick_wait_android/design_system/inputs/generic_input.dart';
import 'package:quick_wait_android/design_system/logo/logo_quick_wait.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E4FDFF"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LogoQuickWait(),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: GenericInput(
                  label: 'Nova senha',
                  alignment: CrossAxisAlignment.start,
                
                )),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: GenericInput(
                  label: 'Confirmar nova senha',
                  alignment: CrossAxisAlignment.start,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    color: HexColor("#E4FDFF"),
                    borderRadius: BorderRadius.circular(17)),
                child: RoundedElevatedButton(
                  title: "Enviar",
                  onPressed: () {
                    Modular.to.navigate("/home");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
