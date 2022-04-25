import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/features/auth/domain/entities/user_entity.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginController {
  factory LoginController() {
    if (_this == null) _this = LoginController._();
    return _this!;
  }

  static LoginController? _this;
  LoginController._();

  static LoginController get con => _this!;

  final formKey = GlobalKey<FormState>();
  UserEntity formData = UserEntity();

  submitForm(context) async {
    formKey.currentState!.save();

    if (formData.name != 'framework' && formData.password != 'frame') {
      formKey.currentState?.reset();
      return showAlert(
        context: context,
        onClick: Navigator.pop,
        buttonText: "Ok",
        message: "Login ou senha inválidos.",
      );
    } else {
      Modular.to.navigate("/home");
    }
  }

  showAlert({context, required String message, required String buttonText, required Function onClick}) {
    Alert alert = Alert(
      context: context,
      title: "Atenção",
      buttons: [
        DialogButton(
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => onClick(context),
          width: 120,
        )
      ],
      style: AlertStyle(
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: const TextStyle(fontWeight: FontWeight.bold),
        animationDuration: const Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: const TextStyle(fontSize: 26, color: Colors.red),
      ),
      desc: message,
    );

    return alert.show();
  }
}
