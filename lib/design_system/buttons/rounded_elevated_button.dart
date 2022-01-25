import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    required this.title,
  }) : super(key: key);
  final Function() onPressed;
  final Function()? onLongPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style: TextStyle(
          color: HexColor(
            "#12A1A7",
          ),
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
