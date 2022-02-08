import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/features/auth/presentation/widgets/forgot_password_lower_body.dart';
import 'package:quick_wait_android/features/auth/presentation/widgets/forgot_password_upper_body.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E4FDFF"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ForgotPasswordUpperBody(),
            ForgotPasswordLowerBody(),
          ],
        ),
      ),
    );
  }
}
