import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController {

  factory LoginController() {
    if (_this == null) _this = LoginController._();
    return _this!;
  }

  static LoginController? _this;
  LoginController._();

  static LoginController get con => _this!;


  submitForm(context) async {
  }
}