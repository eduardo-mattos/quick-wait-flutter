import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String title, String description) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Confirmar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
