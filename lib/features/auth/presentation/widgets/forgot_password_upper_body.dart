import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';

class ForgotPasswordUpperBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CircularButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0, bottom: 45.0),
            child: Center(
              child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/lock.png')),
            ),
          ),
        ],
      ),
    );
  }
}
