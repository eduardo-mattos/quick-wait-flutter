import 'package:flutter/material.dart';

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
      child: Text(title, style: TextStyle(color: Colors.grey.shade600)),
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
