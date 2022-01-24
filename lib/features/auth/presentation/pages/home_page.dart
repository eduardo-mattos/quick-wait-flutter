import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:quick_wait_android/features/auth/presentation/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Container(color: Colors.blue.shade50),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 130,
                    width: 130,
                  ),
                ),
                Container(
                  height: 30,
                ),
                Container(
                    child: SignInButton(
                  Buttons.Google,
                  text: "Entrar com o google ",
                  onPressed: () {},
                )),
                Container(
                    child: SignInButton(
                  Buttons.Facebook,
                  text: "Entrar com o facebook ",
                  onPressed: () {},
                )),
                Container(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 2,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 51, 204, 255), width: 1),
                        borderRadius: BorderRadius.vertical(),
                      ),
                    ),
                    Positioned(
                        left: 120,
                        top: 12,
                        child: Container(
                          color: Colors.blue.shade50,
                          padding: EdgeInsets.only(left: 12, right: 12),
                          child: Text(
                            'OU',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        )),
                  ],
                )),
                Container(
                    child: Container(
                        width: 220,
                        child: ElevatedButton(
                          child: Text('ENTRAR ', style: TextStyle(color: Colors.grey.shade600)),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          onLongPress: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white
                          ),
                        ))),
                Container(
                    child: Container(
                        width: 220,
                        child: ElevatedButton(
                          child: Text('CADASTRAR-SE ',style: TextStyle(color: Colors.grey.shade600)),
                          onPressed: () {},
                          onLongPress: () {},
                           style: ElevatedButton.styleFrom(
                            primary: Colors.white
                          ),
                        ))),
                Container(
                    child: Container(
                        width: 220,
                        child: ElevatedButton(
                          child: Text('ENTRAR COMO CONVIDADO', style: TextStyle(color: Colors.grey.shade600)),
                          onPressed: () {},
                          onLongPress: () {},
                           style: ElevatedButton.styleFrom(
                            primary: Colors.white
                          ),
                        ))),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
