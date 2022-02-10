import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Function() onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      margin: const EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: icon,
          color: const Color(0xFF12A1A7),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
