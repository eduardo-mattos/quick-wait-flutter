import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeMenuController {
  factory HomeMenuController() {
    if (_this == null) _this = HomeMenuController._();
    return _this!;
  }

  static HomeMenuController? _this;
  HomeMenuController._();

  static HomeMenuController get con => _this!;

  submitForm(context) async {
    Modular.to.pushNamed('/hospital');
  }
}
