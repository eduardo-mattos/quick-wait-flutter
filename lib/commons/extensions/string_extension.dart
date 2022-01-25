import 'package:flutter/rendering.dart';

extension ColorExtension on String {
  Color toColor() {
    final value = this;
    final hexCleaned = value.replaceAll("#", "");
    final hexResult = "0xff$hexCleaned";
    final result = int.parse(hexResult);

    return Color(result);
  }
}
