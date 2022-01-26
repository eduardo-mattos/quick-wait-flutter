import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController {

  factory HomeController() {
    if (_this == null) _this = HomeController._();
    return _this!;
  }

  static HomeController? _this;
  HomeController._();

  static HomeController get con => _this!;


  submitForm(context) async {
    Modular.to.navigate('/auth/login');
  }
}