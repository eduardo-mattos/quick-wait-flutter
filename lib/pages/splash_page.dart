import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/splash.png'),
        fit: BoxFit.cover,
      ),
    )
  );
  }
  @override
  void initState() {
    Future.delayed(Duration (seconds: 2)).then((value) => Modular.to.navigate('/auth/'));
    super.initState();
  }
}