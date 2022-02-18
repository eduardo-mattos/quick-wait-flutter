import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class HospitalController {
  factory HospitalController() {
    if (_this == null) _this = HospitalController._();
    return _this!;
  }

  static HospitalController? _this;
  HospitalController._();

  static HospitalController get con => _this!;

  getLocate() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  submitForm(context) async {
    Modular.to.pushNamed('/auth/login');
  }
}
