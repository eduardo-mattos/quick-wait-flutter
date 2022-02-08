import 'package:flutter/material.dart';

class LogoQuickWait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 180.0),
      child: Center(
        child: SizedBox(
            width: 200,
            height: 150,
            child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
