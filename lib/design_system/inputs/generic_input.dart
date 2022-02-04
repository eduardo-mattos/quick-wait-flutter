// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GenericInput extends StatelessWidget {
  String label;
  GenericInput({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF12A1A7), fontSize: 20, fontFamily: 'Quicksand'),
              ),
            ),
            Material(
              elevation: 4.0,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(17),
              child: TextField(
                onChanged: (text) {},
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  height: 0.6
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 0.2),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
