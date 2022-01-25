import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 130,
              width: 130,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) => Modular.to.navigate('/auth/'));
    super.initState();
  }
}
