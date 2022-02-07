import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? automaticallyImplyLeading;
  bool isOnmodal;
  late double toolbarHeight;
  CustomAppBar(
      {Key? key,
      required this.title,
      this.automaticallyImplyLeading,
      this.isOnmodal = false})
      : super(key: key) {
    toolbarHeight = isOnmodal ? 54 : 84;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 26, right: 50, bottom: 16),
        child: AppBar(
          elevation: 1,
          automaticallyImplyLeading: automaticallyImplyLeading ?? false,
          shadowColor: Colors.transparent,
          backgroundColor: const Color(0xFF12A1A7),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 32),
          ),
          centerTitle: !isOnmodal,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          toolbarHeight: toolbarHeight,
        ),
      ),
    );
  }

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
