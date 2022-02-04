import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(185),
            bottomRight: Radius.circular(185)),
        color: HexColor("#BDF9F2"),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
        child: Center(
          child: SizedBox(
              width: 200,
              height: 150,
              child: Image.asset('assets/images/logo.png')),
        ),
      ),
    );
  }
}
