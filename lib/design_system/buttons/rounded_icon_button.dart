import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    required this.title,
    this.icon,
  }) : super(key: key);
  final Function() onPressed;
  final Function()? onLongPress;
  final String title;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: [
          icon ?? const SizedBox(),
          const SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              color: HexColor(
                "#12A1A7",
              ),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
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
