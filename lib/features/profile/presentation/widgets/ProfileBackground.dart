import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

double _sigmaX = 2.0; // from 0-10
double _sigmaY = 2.0; // from 0-10
double _opacity = 0.35; // from 0-1.0

class ProfileBackground extends StatelessWidget {
  final Widget child;
  File? imageFile;
  ProfileBackground({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var backGroudProps = imageFile == null
        ? const BoxDecoration(color: Color(0xFF12A1A7))
        : BoxDecoration(
            image: DecorationImage(
            image: Image.file(imageFile!).image,
            fit: BoxFit.cover,
          ));
    return SizedBox(
      width: double.infinity,
      height: size.height / 1.8,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -2,
            right: -2,
            left: -2,
            child: Container(
              height: size.height / 1.8,
              decoration: backGroudProps,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                child: Container(
                  color: Colors.blue.withOpacity(_opacity),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
