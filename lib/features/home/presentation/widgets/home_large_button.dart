import 'package:flutter/cupertino.dart';

import '../../../../design_system/buttons/rounded_icon_button.dart';

class HomeLargeButton extends StatelessWidget {
  const HomeLargeButton({
    Key? key,
    required this.height,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final double height;
  final String title;
  final Widget icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: RoundedIconButton(
        onPressed: onPressed,
        title: title,
        icon: icon,
      ),
    );
  }
}
