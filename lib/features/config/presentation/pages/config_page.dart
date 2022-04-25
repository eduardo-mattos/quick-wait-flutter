import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:quick_wait_android/features/home/presentation/widgets/home_large_button.dart';
import '../../../../design_system/buttons/rounded_elevated_button.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage() : super();

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  // const ConfigPage({Key? key}) : super(key: key);
  final double _buttonHeight = 90;
  final double _buttonsSpacing = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E4FDFF"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CircularButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        Modular.to.pop();
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 90,
                    child: Image.asset(
                      'assets/icons/settings_large.png',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'CONFIGURAÇÕES',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF12A1A7), fontSize: 20, fontFamily: 'Quicksand'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 35, top: 20),
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                    child: RoundedElevatedButton(
                      title: "PERFIL",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  Container(
                    margin: const EdgeInsets.only(left: 35, top: 20),
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                    child: RoundedElevatedButton(
                      title: "PLANO DE SAÚDE",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  Container(
                    margin: const EdgeInsets.only(left: 35, top: 20),
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                    child: RoundedElevatedButton(
                      title: "FALE CONOSCO",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  Container(
                    margin: const EdgeInsets.only(left: 35, top: 20),
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                    child: RoundedElevatedButton(
                      title: "APAGAR PERFIL",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: _buttonsSpacing),
                  Container(
                    margin: const EdgeInsets.only(left: 35, top: 20),
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                    child: RoundedElevatedButton(
                      title: "SAIR",
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 35, top: 20),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                      child: SwitchListTile(
                          title: const Text(
                            'Notificações de lembretes',
                            style: TextStyle(color: Color(0xFF12A1A7)),
                          ),
                          contentPadding: const EdgeInsets.only(left: 10, top: 10),
                          value: true,
                          onChanged: (bool value) {
                            setState(() {
                              // _isBluetoothOn = value;
                            });
                          })),
                  SizedBox(height: _buttonsSpacing),
                  Container(
                      margin: const EdgeInsets.only(left: 35, bottom: 35),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(color: HexColor("#E4FDFF"), borderRadius: BorderRadius.circular(17)),
                      child: SwitchListTile(
                          title: const Text(
                            'Notificações de noticias',
                            style: TextStyle(color: Color(0xFF12A1A7)),
                          ),
                          contentPadding: const EdgeInsets.only(left: 10, top: 10),
                          value: false,
                          onChanged: (bool value) {
                            setState(() {
                              // _isBluetoothOn = value;
                            });
                          })),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
