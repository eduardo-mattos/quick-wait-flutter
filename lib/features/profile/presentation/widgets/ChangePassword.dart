import 'package:flutter/material.dart';
import 'package:quick_wait_android/design_system/app_bar/CustomAppBar.dart';
import 'package:quick_wait_android/design_system/inputs/generic_input.dart';

class ChangePassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  const ChangePassword(
      {Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            CustomAppBar(
              title: "Alterar Senha",
              isOnmodal: true,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: _size.width * 0.70,
              height: _size.height * 0.60,
              child: Wrap(
                children: [
                  SizedBox(height: _size.height * 0.1),
                  GenericInput(
                    label: "Senha Atual",
                  ),
                  SizedBox(height: _size.height * 0.03),
                  GenericInput(
                    label: "Nova Senha",
                  ),
                  SizedBox(height: _size.height * 0.03),
                  GenericInput(
                    label: "Confirmar Senha",
                  ),
                ],
              ),
            ),
            Container(
              width: _size.width * 0.73,
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  enableFeedback: false,
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF12A1A7)),
                ),
                onPressed: () {},
                child: const Text(
                  'Alterar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
