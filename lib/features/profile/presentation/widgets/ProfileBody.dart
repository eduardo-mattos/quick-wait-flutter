import 'package:flutter/material.dart';
import 'package:quick_wait_android/design_system/alert/Alerts.dart';
import 'package:quick_wait_android/features/profile/presentation/widgets/HealthPlanChips.dart';
import 'package:quick_wait_android/features/profile/presentation/widgets/ChangePassword.dart';
import 'package:quick_wait_android/features/profile/presentation/widgets/ProfileBackground.dart';

import 'AddHealthPlanChips.dart';

enum ImageSourceType { gallery, camera }

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  //late PopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    void _submit() {}

    void _openChangePasswordModal(context) {
      final Size _size = MediaQuery.of(context).size;
      showModalBottomSheet(
          isScrollControlled: true,
          constraints: BoxConstraints(
              maxWidth: _size.width * 0.9, minHeight: _size.height * 0.95),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          context: context,
          builder: (BuildContext bc) {
            return ChangePassword(formKey: _formKey, onSubmit: _submit);
          });
    }

    return Column(children: [
      ProfileBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 46, right: 46),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 128,
                      ),
                      Positioned(
                          bottom: 0,
                          right: -25,
                          child: RawMaterialButton(
                            key: btnKey,
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: const Color(0xFFF5F6F9),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xFF12A1A7),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            shape: const CircleBorder(),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "John Doe",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "28/02/1983",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 38.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.phone_android,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  TextSpan(
                      text: "+55 61 99999-9999",
                      style: TextStyle(color: Colors.white, fontSize: 18.0))
                ])),
              ),
              const SizedBox(height: 12.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child:
                            Icon(Icons.email, color: Colors.white, size: 18)),
                  ),
                  TextSpan(
                      text: "johndoe@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 18.0))
                ])),
              ),
              const SizedBox(height: 12.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.location_on,
                            color: Colors.white, size: 18)),
                  ),
                  TextSpan(
                      text: "Brasília-DF",
                      style: TextStyle(color: Colors.white, fontSize: 18.0))
                ])),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _openChangePasswordModal(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(children: <InlineSpan>[
                      WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.password,
                                color: Color(0xFF12A1A7), size: 18)),
                      ),
                      TextSpan(
                          text: "Alterar Senha",
                          style: TextStyle(color: Color(0xFF12A1A7), fontSize: 18.0))
                    ]),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.account_balance,
                            color: Color(0xFF12A1A7), size: 18)),
                  ),
                  TextSpan(
                      text: "Planos de Saúde",
                      style: TextStyle(color: Color(0xFF12A1A7), fontSize: 18.0))
                ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Wrap(
                runSpacing: 10.0,
                children: [
                  HealthPlan(title: 'Unimed BH'),
                  HealthPlan(title: 'Hapivida'),
                  HealthPlan(title: 'Humana'),
                  const AddHealthPlanChips(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showAlertDialog(context, "Confirmação",
                    "Gostaria de confirmar a Finalização da sessão?");
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child:
                              Icon(Icons.logout, color: Color(0xFF12A1A7), size: 18)),
                    ),
                    TextSpan(
                        text: "Finalizar Sessão",
                        style: TextStyle(color: Color(0xFF12A1A7), fontSize: 18.0))
                  ])),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showAlertDialog(context, "Confirmação",
                    "Gostaria de confirmar apagar a conta?");
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.power_off,
                              color: Color(0xFF12A1A7), size: 18)),
                    ),
                    TextSpan(
                        text: "Apagar Conta",
                        style: TextStyle(color: Color(0xFF12A1A7), fontSize: 18.0))
                  ])),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 50)
    ]);
  }
}
